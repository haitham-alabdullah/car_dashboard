import 'package:car/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../classes/theme.dart';

class BottomButtonItemAdd extends StatelessWidget {
  const BottomButtonItemAdd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsProvider>(builder: (provider) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 25),
        child: GestureDetector(
          child: Container(
            height: 85,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: LiTheme.onBgColor(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LiTheme.text(
                  'Add',
                  style: LiTheme.textStyle(
                    color: LiTheme.getPrimary(),
                  ),
                ),
                Icon(
                  Icons.add_rounded,
                  color: LiTheme.getPrimary(),
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
