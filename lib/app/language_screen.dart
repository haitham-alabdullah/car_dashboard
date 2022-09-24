import 'package:car/app/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../classes/theme.dart';
import '../providers/settings_provider.dart';

class LanguageScreen extends StatelessWidget {
  static const String routeName = '/language-screen';
  const LanguageScreen({Key? key}) : super(key: key);

  _chooseLanguage(String lang) {
    final settings = Get.find<SettingsProvider>();
    settings.toggleIsFirstTime();
    settings.toggleLanguage(lang);
    Get.toNamed(MainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsProvider>(
      builder: (provider) => Scaffold(
        backgroundColor:
            provider.isDarkMode ? LiTheme.bgDarkColor : LiTheme.bgLightColor,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: Get.width * .7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                LiTheme.isEmpty("Choose the default language".tr),
                const SizedBox(height: 30),
                ...provider.allLanguages
                    .map((lang) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('${lang.flag}'),
                            onBackgroundImageError: (_, __) => Text(lang.code),
                          ),
                          title: Text(
                            lang.name,
                            style: TextStyle(
                              color: provider.language == lang.code
                                  ? LiTheme.textColorLight
                                  : provider.isDarkMode
                                      ? LiTheme.bgLightColor
                                      : LiTheme.textColorDark,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          selectedTileColor: LiTheme.primary,
                          selectedColor: LiTheme.primary,
                          textColor: provider.isDarkMode
                              ? LiTheme.bgLightColor
                              : LiTheme.textColorDark,
                          selected: provider.language == lang.code,
                          onTap: () => _chooseLanguage(lang.code),
                        ))
                    .toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
