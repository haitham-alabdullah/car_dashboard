import 'package:flutter/material.dart';

import '../../../classes/theme.dart';

class PlayerSong extends StatelessWidget {
  const PlayerSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 12),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 80,
            height: 80,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholders/music.png',
              image: 'https://picsum.photos/256',
              fadeInDuration: const Duration(milliseconds: 300),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/placeholders/music.png');
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LiTheme.text('Too Close to Touch'),
              const SizedBox(height: 10),
              LiTheme.text('In the Name of Love',
                  style: LiTheme.boldTextStyle()),
            ],
          ),
        ),
        Icon(
          Icons.queue_music_rounded,
          color: LiTheme.getTextColor(),
        )
      ]),
    );
  }
}
