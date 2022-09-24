import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/settings_provider.dart';

class LiTheme {
  static const Color primary = Color(0xFF01C157);
  static const Color onPrimary = Color(0xFFDEFCEB);

  static const Color textColor = Color(0xFF4E5061);
  static const Color textColorGrey = Color(0xFF4F5A6E);
  static const Color textColorDark = Color(0xFF303641);
  static const Color textColorLight = Color(0xFFFFFFFF);

  static const Color bgLightColor = Colors.white;
  static const Color bgDarkColor = Color(0xFF111111);
  static const Color onDarkColor = Color(0xFF292D32);
  static const Color onDarkColorLight = Color(0xFF616161);

  static const Duration animationDuration = Duration(milliseconds: 200);

  static Color bgColor() {
    final isDark = Get.find<SettingsProvider>().isDarkMode;
    if (isDark) return bgDarkColor;
    return bgLightColor;
  }

  static Color onBgColor() {
    final isDark = Get.find<SettingsProvider>().isDarkMode;
    if (isDark) return onDarkColor;
    return onPrimary;
  }

  static Color getPrimary() {
    final isDark = Get.find<SettingsProvider>().isDarkMode;
    if (isDark) return onDarkColorLight;
    return primary;
  }

  static Brightness themeMode() {
    final isDark = Get.find<SettingsProvider>().isDarkMode;
    if (isDark) return Brightness.light;
    return Brightness.dark;
  }

  static Color getTextColor() {
    final isDark = Get.find<SettingsProvider>().isDarkMode;
    if (isDark) return textColorLight;
    return textColorDark;
  }

  static TextStyle textStyle({double size = 16, Color? color}) {
    return TextStyle(
      color: color ?? getTextColor(),
      fontWeight: FontWeight.w500,
      fontSize: size,
    );
  }

  static TextStyle boldTextStyle({double size = 18, Color? color}) {
    return TextStyle(
      color: color ?? getTextColor(),
      fontWeight: FontWeight.w600,
      fontSize: size,
    );
  }

  static Widget getSvg(String fileName,
      {double? size, Color? color, BoxFit? fit}) {
    try {
      // final item = SvgPicture.asset(
      //   'assets/images/svgs/$fileName.svg',
      //   key: Key(fileName),
      //   width: size ?? 20,
      //   height: size ?? 20,
      //   fit: BoxFit.fitHeight,
      //   color: color ?? primary,
      //   colorBlendMode: BlendMode.srcIn,
      //   theme: SvgTheme(
      //     fontSize: 20,
      //     xHeight: size,
      //   ),
      //   clipBehavior: Clip.antiAliasWithSaveLayer,
      // );
      // return item;
      return const SizedBox();
    } catch (e) {
      return const SizedBox();
    }
  }

  static Widget isEmpty(String mesage) {
    final isDark = Get.find<SettingsProvider>().isDarkMode;
    return Center(
      child: Text(
        mesage,
        style: TextStyle(
          color: isDark ? LiTheme.textColorLight : LiTheme.textColorGrey,
          fontSize: 22,
        ),
      ),
    );
  }

  static Widget isError(String mesage) {
    return Center(
      child: Text(
        mesage,
        style: const TextStyle(
          color: Colors.redAccent,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static BoxShadow boxShadow() {
    return BoxShadow(
      color: Colors.black12.withOpacity(.1),
      offset: const Offset(0, .1),
      blurRadius: 2,
      spreadRadius: .1,
    );
  }

  static BoxShadow activeCircleShadow() {
    return BoxShadow(
      color: primary.withOpacity(.08),
      blurRadius: 3,
      offset: const Offset(0, .3),
    );
  }
}
