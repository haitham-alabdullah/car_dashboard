import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../classes/theme.dart';
import '../../../providers/settings_provider.dart';
import 'car_code_item.dart';

class CarGearCodesWidget extends StatelessWidget {
  const CarGearCodesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsProvider>(builder: (provider) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          child: Container(
            width: 340,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: LiTheme.onBgColor(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CarCodeItem(
                  title: 'P',
                  isText: true,
                  textSize: 22,
                  // activeColor: Colors.red,
                ),
                CarCodeItem(
                  title: 'R',
                  isText: true,
                  textSize: 22,
                  // activeColor: Colors.red,
                ),
                CarCodeItem(
                  title: 'N',
                  isText: true,
                  textSize: 22,
                  activeColor: Colors.amber,
                ),
                CarCodeItem(
                  title: 'D',
                  isText: true,
                  textSize: 22,
                  // activeColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
