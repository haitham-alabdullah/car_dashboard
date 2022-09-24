import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../classes/theme.dart';
import '../../../providers/settings_provider.dart';

class BottomButtonItem extends StatelessWidget {
  const BottomButtonItem({
    required this.title,
    required this.icon,
    this.value,
    Key? key,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsProvider>(builder: (provider) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 25),
        child: GestureDetector(
          child: Container(
            constraints: const BoxConstraints(minWidth: 125, maxWidth: 150),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: LiTheme.onBgColor(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LiTheme.text(
                  title,
                  style: LiTheme.textStyle(),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: LiTheme.themeMode() == Brightness.light
                              ? LiTheme.textColorDark
                              : LiTheme.primary,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            icon,
                            size: 20,
                            color: LiTheme.themeMode() == Brightness.light
                                ? LiTheme.getTextColor()
                                : LiTheme.textColorLight,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      FittedBox(
                          child: LiTheme.text(
                        '$value',
                        style: LiTheme.boldTextStyle(),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
