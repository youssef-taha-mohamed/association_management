import 'package:flutter/material.dart';
//import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

abstract final class NavigationService {
 // static late PersistentTabController controller;

  

  const NavigationService();
  static Object? arguments;
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static void goBack() {
    if (navigatorKey.currentState!.canPop()) {
      return navigatorKey.currentState!.pop();
    }
  }
}
