import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/settings_provider.dart';
// import '../widgets/block_button.dart';
import 'theme.dart';

class Dialogs {
  static bottomSheet(Widget child, {int duration = 200}) {
    final isDark = Get.find<SettingsProvider>().isDarkMode;
    Get.bottomSheet(
      child,
      backgroundColor: isDark ? LiTheme.onDarkColor : LiTheme.bgLightColor,
      enterBottomSheetDuration: Duration(milliseconds: duration),
      exitBottomSheetDuration: Duration(milliseconds: duration),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  static snackbar(
    String message, {
    String? title,
    IconData? icon,
    Duration? duration,
    Duration? animationDuration,
    MaterialColor? color,
  }) {
    // if (Get.isSnackbarOpen) return;
    Get.rawSnackbar(
      titleText: Text(
        title ?? 'Success'.tr,
        style: TextStyle(
          color: color?.shade800 ?? Colors.green.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: color?.shade800 ?? Colors.green.shade800,
          // fontWeight: FontWeight.normal,
        ),
      ),
      icon: Icon(
        icon ?? Icons.check_circle_outline,
        color: color?.shade700 ?? Colors.green.shade700,
      ),
      shouldIconPulse: false,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: color?.shade50 ?? Colors.green.shade50,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      borderRadius: 15,
      isDismissible: true,
      dismissDirection:
          Platform.isIOS ? DismissDirection.up : DismissDirection.horizontal,
      snackPosition: SnackPosition.TOP,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
      animationDuration: animationDuration ?? const Duration(milliseconds: 500),
    );
    return null;
  }

  static fullScreen(
      {required String title,
      required String content,
      required String bottonText,
      VoidCallback? callback,
      bool? isLoading,
      bool? dismissible,
      bool isDark = false,
      Future<bool> Function()? onWillPop}) {
    Get.defaultDialog(
      title: title,
      barrierDismissible: dismissible ?? true,
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      middleText: content,
      titleStyle: TextStyle(
          color: isDark ? LiTheme.textColorLight : LiTheme.textColorDark),
      backgroundColor: isDark ? LiTheme.onDarkColor : LiTheme.bgLightColor,
      middleTextStyle: TextStyle(
        fontSize: 16,
        color: isDark ? LiTheme.textColorLight : LiTheme.textColorDark,
      ),
      // confirm: LiBlockButton(
      //   bottonText,
      //   onPressed: callback ?? () => Get.back(),
      //   isLoading: isLoading ?? false,
      // ),
      onWillPop: onWillPop ?? () async => true,
    );
  }

  static customFullScreen(
      {required String title,
      required Widget content,
      required String bottonText,
      VoidCallback? callback,
      bool? isLoading,
      bool? dismissible,
      bool isDark = false,
      Future<bool> Function()? onWillPop}) {
    Get.defaultDialog(
      title: title,
      barrierDismissible: dismissible ?? true,
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      content: content,
      titleStyle: TextStyle(
          color: isDark ? LiTheme.textColorLight : LiTheme.textColorDark),
      backgroundColor: isDark ? LiTheme.onDarkColor : LiTheme.bgLightColor,
      // confirm: LiBlockButton(
      //   bottonText,
      //   onPressed: callback ?? () => Get.back(),
      //   isLoading: isLoading ?? false,
      // ),
      onWillPop: onWillPop ?? () async => true,
    );
  }

  static emptyFullScreen(
      {required Widget content,
      bool? dismissible,
      bool isDark = false,
      Future<bool> Function()? onWillPop}) {
    Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      barrierDismissible: dismissible ?? true,
      contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      content: content,
      backgroundColor: isDark ? LiTheme.onDarkColor : LiTheme.bgLightColor,
      onWillPop: onWillPop ?? () async => true,
    );
  }
}
