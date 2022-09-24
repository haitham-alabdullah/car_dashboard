import 'package:car/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/restart_app.dart';
import '../../classes/theme.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold(this.child, {Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<SettingsProvider>();
    return Scaffold(
      backgroundColor: LiTheme.bgColor(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LiTheme.onBgColor(),
        onPressed: () {
          final isDark = settings.isDarkMode;
          settings.toggleDarkMode(!isDark);
          RestartWidget.restartApp(context);
        },
        child: const Icon(Icons.dark_mode),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
