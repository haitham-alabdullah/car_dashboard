import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../classes/routes.dart';
import '../providers/settings_provider.dart';

class FirstTimeMiddleware extends GetMiddleware {
  @override
  redirect(String? route) {
    final isFirstTime = Get.find<SettingsProvider>().isFirstTime;
    if (isFirstTime && route != Routes.langRoute) {
      return RouteSettings(name: Routes.langRoute);
    }
    return null;
  }
}
