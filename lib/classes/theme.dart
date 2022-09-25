import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return primary;
  }

  static TextStyle textStyle(
      {double size = 14, Color? color, List<Shadow>? shadows}) {
    return TextStyle(
      color: color ?? getTextColor(),
      fontWeight: FontWeight.w500,
      fontSize: size,
      shadows: shadows,
    );
  }

  static TextStyle boldTextStyle(
      {double size = 16, Color? color, List<Shadow>? shadows}) {
    return TextStyle(
      color: color ?? getTextColor(),
      fontWeight: FontWeight.w600,
      fontSize: size,
      shadows: shadows,
    );
  }

  static Widget getSvg(
    String fileName, {
    double? size,
    Color? color,
    BoxFit? fit,
    bool isCode = false,
    List<Shadow>? shadows,
  }) {
    try {
      final item = SvgPicture.asset(
        'assets/images/svgs/$fileName.svg',
        key: Key(fileName),
        width: size ?? 25,
        height: size ?? 25,
        fit: BoxFit.fitHeight,
        color: color ?? (isCode ? getPrimary().withOpacity(.5) : primary),
        colorBlendMode: BlendMode.srcIn,
        theme: SvgTheme(
          fontSize: 25,
          xHeight: size,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      );
      return item;
    } catch (e) {
      return const SizedBox();
    }
  }

  static Widget text(
    String text, {
    TextStyle? style,
    TextAlign? align,
    TextDirection? direction,
  }) {
    return Text(
      text.tr,
      style: style ?? textStyle(),
      textAlign: align,
      textDirection: direction,
    );
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

  static BoxShadow boxShadow({Color? color}) {
    return BoxShadow(
      color: (color ?? primary).withOpacity(.1),
      offset: const Offset(0, .3),
      blurRadius: 5,
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
