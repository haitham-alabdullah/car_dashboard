import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../models/settings/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends GetxController {
  final Rx<String> _language = Rx<String>(
    Get.deviceLocale.toString().substring(0, 2),
  );
  final Rx<bool> _isDarkMode = Rx<bool>(false);
  final Rx<bool> _wifiOnly = Rx<bool>(false);
  final Rx<bool> _isFirstTime = Rx<bool>(true);

  String get language => _language.value;
  bool get isDarkMode => _isDarkMode.value;

  bool get wifiOnly => _wifiOnly.value;
  bool get isRtl => _language.value == 'ar';
  bool get isFirstTime => _isFirstTime.value;

  List<LanguageModel> get allLanguages => [
        LanguageModel('English', 'en', flag: 'assets/images/flags/en.png'),
        LanguageModel('العربية', 'ar', flag: 'assets/images/flags/ar.png'),
        LanguageModel('Русский', 'ru', flag: 'assets/images/flags/ru.png'),
      ];

  set language(String value) => _language.value = value;
  set isDarkMode(bool value) => _isDarkMode.value = value;
  set wifiOnly(bool value) => _wifiOnly.value = value;

  void save() async {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('language', language);
      prefs.setBool('isDarkMode', isDarkMode);
      prefs.setBool('wifiOnly', wifiOnly);
    });
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _isFirstTime.value = prefs.getBool('isFirstTime') ?? true;
    language = prefs.getString('language') ??
        Get.deviceLocale.toString().substring(0, 2);

    var instance = SchedulerBinding.instance;
    var brightness = instance.window.platformBrightness;
    isDarkMode = brightness == Brightness.dark; //prefs.getBool('isDarkMode') ??
    wifiOnly = prefs.getBool('wifiOnly') ?? false;
    update();
  }

  void toggleIsFirstTime() {
    _isFirstTime.value = false;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isFirstTime', false);
    });
    update();
  }

  void toggleDarkMode(value) {
    isDarkMode = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    save();
    update();
  }

  void toggleWifiOnly(value) {
    wifiOnly = value;
    save();
    update();
  }

  void toggleLanguage(value) {
    language = value;
    Get.updateLocale(Locale(value));
    save();
    update();
  }

  String getLanguageName() {
    switch (language) {
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      case 'ru':
        return 'Русский';
      default:
        return 'English';
    }
  }
}
