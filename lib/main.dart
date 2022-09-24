import 'dart:io';

import 'package:eraser/eraser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'app/app.dart';
import 'app/restart_app.dart';
import 'classes/routes.dart';
import 'classes/translations.dart';
import 'providers/settings_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );
  await App.initializeCore();
  await App.initializeUserProviders();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // FlutterNativeSplash.remove();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (AppLifecycleState.resumed == state) {
      // Get.find<NotificationsProvider>().load();
      Eraser.clearAllAppNotifications();
      if (Platform.isIOS) {
        Eraser.resetBadgeCountAndRemoveNotificationsFromCenter();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<SettingsProvider>();
    return RestartWidget(
      child: GetMaterialApp(
        title: App.name,
        theme: ThemeData(fontFamily: 'Outfit'),
        getPages: Routes.routesList,
        initialRoute: Routes.homeRoute,
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(),
        locale: Locale(settings.language),
        fallbackLocale: const Locale('en'),
        defaultTransition: Transition.fadeIn,
        onUnknownRoute: Routes.errorRoute,
      ),
    );
  }
}
