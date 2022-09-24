import 'package:flutter/material.dart';

import '../../../classes/theme.dart';

class PlayerTimer extends StatelessWidget {
  const PlayerTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LiTheme.text('1:42'),
              LiTheme.text('0:18'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                backgroundColor: LiTheme.themeMode() == Brightness.light
                    ? LiTheme.onDarkColorLight
                    : LiTheme.bgLightColor,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(LiTheme.primary),
                minHeight: 10,
                // 102 is the played time
                // 120 is the full time
                value: 102 / 120,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
