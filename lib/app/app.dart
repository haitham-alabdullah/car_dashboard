import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../classes/theme.dart';
import '../providers/main_provider.dart';
import '../providers/settings_provider.dart';

class App {
  static const String name = 'SEA HORSE';
  static const String version = '2.0.0';
  static const String enqkey = '1234';

  static copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(Get.context as BuildContext).showSnackBar(
      SnackBar(
        content: Text(
          'Copied to Clipboard : $text',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: LiTheme.primary,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  static Future<bool> isNotConnected() async {
    final isWifiOnly = Get.find<SettingsProvider>().wifiOnly;
    return await Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.none) {
        throw 'NO_INTERNET';
      } else if (isWifiOnly && value != ConnectivityResult.wifi) {
        throw 'WIFI_ONLY_MODE';
      }
      return false;
    });
  }

  static String getRandomKey() {
    final ran = Random.secure();
    const randoms =
        'abcdefghijklmnopqrstuvwxyzABCDEFGGHIJKLMNOPQRSTUVWXYZ1234567890';
    return List<String>.generate(16, (index) => randoms[ran.nextInt(63)])
        .join();
  }

  static initializeCore() async {
    Get.lazyPut(() => SettingsProvider(), fenix: true);
    await Get.find<SettingsProvider>().load();
  }

  static initializeUserProviders() {
    Get.lazyPut(() => MainProvider(), fenix: true);
  }
}
