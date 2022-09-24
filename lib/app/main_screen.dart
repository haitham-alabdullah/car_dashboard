import 'package:car/app/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../classes/theme.dart';
import '../providers/main_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/side_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final provider = Get.find<MainProvider>();

  @override
  void initState() {
    super.initState();
    final window = WidgetsBinding.instance.window;

    // This callback is called every time the brightness changes.
    window.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;
      final settings = Get.find<SettingsProvider>();
      settings.toggleDarkMode(brightness == Brightness.dark);
      RestartWidget.restartApp(context);
    };
    // WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = Get.find<SettingsProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: LiTheme.bgColor(),
          systemNavigationBarColor:
              settings.isDarkMode ? LiTheme.onDarkColor : LiTheme.bgLightColor,
          systemNavigationBarIconBrightness: LiTheme.themeMode(),
          statusBarIconBrightness: LiTheme.themeMode(), // For Android
          statusBarBrightness: LiTheme.themeMode(), // For iOS
        ),
      ),
      backgroundColor: LiTheme.bgColor(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SideNavigationBar(
              selectedIndex: provider.currentIndex.value,
              onTap: (e) {
                setState(() => provider.currentIndex.value = e);
                provider.onTapped(e);
                // provider.onTapped(e);
              },
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: provider.getCurrentPage(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
