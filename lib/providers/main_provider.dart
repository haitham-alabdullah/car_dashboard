import 'package:car/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/general_screen_scaffold.dart';

class MainProvider extends GetxController {
  RxInt currentIndex = RxInt(0);
  dynamic subArgs;

  toPage(int? arguments, {dynamic subPageArgs}) {
    subArgs = subPageArgs;
    if (arguments != null) {
      currentIndex.value = arguments;
      update();
    }
  }

  onTapped(int value) {
    // if (!Get.find<AuthProvider>().isAuth) {
    //   return Get.offAllNamed(Routes.loginRoute);
    // }
    final bool samePage = value == currentIndex.value;
    if (samePage) return;
    subArgs = null;
    currentIndex.value = value;
    update();
  }

  Widget getCurrentPage() {
    switch (currentIndex.value) {
      case 0:
        return GeneralScaffold(HomeScreen(subArgs));
      case 1:
        return GeneralScaffold(HomeScreen(subArgs));
      case 2:
        return GeneralScaffold(HomeScreen(subArgs));
      case 3:
        return GeneralScaffold(HomeScreen(subArgs));
      case 4:
        return GeneralScaffold(HomeScreen(subArgs));
      default:
        return GeneralScaffold(HomeScreen(subArgs));
    }
  }
}
