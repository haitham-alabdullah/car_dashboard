import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../classes/theme.dart';
import '../../../providers/settings_provider.dart';

class GoogleNavigationsWidget extends StatelessWidget {
  const GoogleNavigationsWidget({
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
            constraints: const BoxConstraints(minWidth: 350),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: LiTheme.onBgColor(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      );
    });
  }
}
