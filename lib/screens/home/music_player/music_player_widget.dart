import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../classes/theme.dart';
import '../../../providers/settings_provider.dart';
import 'player_buttons.dart';
import 'player_song.dart';
import 'player_timer.dart';

class MusicPlayerWidget extends StatelessWidget {
  const MusicPlayerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsProvider>(builder: (provider) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 25),
        child: GestureDetector(
          child: Container(
              height: 220,
              width: 300,
              constraints: const BoxConstraints(minWidth: 350),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: LiTheme.onBgColor(),
              ),
              child: Column(
                children: [
                  PlayerSong(),
                  PlayerTimer(),
                  PlayerButtons(),
                ],
              )),
        ),
      );
    });
  }
}
