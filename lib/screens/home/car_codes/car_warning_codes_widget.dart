import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../classes/theme.dart';
import '../../../providers/settings_provider.dart';
import 'car_code_item.dart';

class CarWarningCodesWidget extends StatelessWidget {
  const CarWarningCodesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsProvider>(builder: (provider) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: LiTheme.onBgColor(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CarCodeItem(
                  title: 'engine-warning',
                  //  activeColor: Colors.orange,
                ),
                CarCodeItem(
                  title: 'oil-can-drip',
                  //  activeColor: Colors.red,
                ),
                CarCodeItem(
                  title: 'car-battery',
                  //  activeColor: Colors.red,
                ),
                CarCodeItem(
                  title: 'seat-belt',
                  // activeColor: Colors.red,
                ),
                CarCodeItem(
                  title: 'car-abs',
                  // activeColor: Colors.orange,
                ),
                CarCodeItem(
                  title: 'car-traction-control',
                  // activeColor: Colors.orange,
                ),
                CarCodeItem(
                  title: 'brake-warning',
                  // activeColor: Colors.orange,
                ),
                CarCodeItem(
                  title: 'car-airbag',
                  //  activeColor: Colors.red,
                ),
                CarCodeItem(
                  title: 'gas-pump',
                  //  activeColor: Colors.orange,
                ),
                CarCodeItem(
                  title: 'tire-pressure-warning',
                  //  activeColor: Colors.orange,
                ),
                CarCodeItem(
                  title: 'oil-temperature',
                  //  activeColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
