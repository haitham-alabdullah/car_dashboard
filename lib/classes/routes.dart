import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/error_screen.dart';
import '../app/language_screen.dart';
import '../app/main_screen.dart';
import '../middlewares/middlewares.dart';

class Routes {
  static String langRoute = LanguageScreen.routeName;
  static String homeRoute = MainScreen.routeName;

  static MaterialPageRoute errorRoute(settings) => MaterialPageRoute(
        builder: (_) => ErrorScreen(
          Exception('Unknown route: ${settings.name}'),
        ),
      );

  static List<GetPage<dynamic>> routesList = [
    GetPage(
      name: LanguageScreen.routeName,
      page: () => const LanguageScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: MainScreen.routeName,
      popGesture: false,
      page: () => const MainScreen(),
      middlewares: [FirstTimeMiddleware()],
      transition: Transition.fadeIn,
    ),
  ];
}

class LiRoute<T> extends MaterialPageRoute<T> {
  LiRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: secondaryAnimation, child: child);
  }
}
