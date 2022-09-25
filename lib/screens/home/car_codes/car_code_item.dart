import 'package:flutter/material.dart';

import '../../../classes/theme.dart';

class CarCodeItem extends StatelessWidget {
  const CarCodeItem({
    required this.title,
    this.activeColor,
    this.isText = false,
    this.textSize,
    Key? key,
  }) : super(key: key);
  final String title;
  final Color? activeColor;
  final bool isText;
  final double? textSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: isText
          ? LiTheme.text(title,
              style: LiTheme.boldTextStyle(
                size: textSize ?? 16,
                color: activeColor ?? LiTheme.getPrimary().withOpacity(.5),
                shadows: activeColor != null
                    ? [LiTheme.boxShadow(color: activeColor)]
                    : [],
              ))
          : LiTheme.getSvg(
              'codes/$title',
              isCode: true,
              color: activeColor,
            ),
    );
  }
}
