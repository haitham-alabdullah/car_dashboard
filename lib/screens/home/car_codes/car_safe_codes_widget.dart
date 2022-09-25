import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../classes/theme.dart';
import '../../../providers/settings_provider.dart';
import 'car_code_item.dart';

class CarSafeCodesWidget extends StatelessWidget {
  const CarSafeCodesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsProvider>(builder: (provider) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          child: Container(
            width: 340,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: LiTheme.onBgColor(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CarCodeItem(
                  title: 'ECO',
                  isText: true,
                  activeColor: Colors.green,
                ),
                CarCodeItem(
                  title: 'car_lights',
                  //  activeColor: Colors.blue,
                ),
                CarCodeItem(
                  title: 'car-light-dimmed',
                  //   activeColor: Colors.blue,
                ),
                CarCodeItem(
                  title: 'car-cruise-control',
                  //   activeColor: Colors.green,
                ),
                CarCodeItem(
                  title: 'Set',
                  isText: true,
                  //   activeColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
