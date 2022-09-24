import 'package:flutter/material.dart';

import '../../../classes/theme.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.skip_previous_rounded,
          color: LiTheme.getTextColor(),
          size: 30,
        ),
        Icon(
          Icons.fast_rewind_rounded,
          color: LiTheme.getTextColor(),
          size: 30,
        ),
        Icon(
          Icons.play_arrow_rounded,
          color: LiTheme.getTextColor(),
          size: 30,
        ),
        Icon(
          Icons.fast_forward_rounded,
          color: LiTheme.getTextColor(),
          size: 30,
        ),
        Icon(
          Icons.skip_next_rounded,
          color: LiTheme.getTextColor(),
          size: 30,
        ),
      ],
    );
  }
}
