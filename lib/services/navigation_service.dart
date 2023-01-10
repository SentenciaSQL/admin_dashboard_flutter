import 'package:flutter/material.dart';

class NavigationService {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo( String ruteName ) {
    navigatorKey.currentState!.pushNamed(ruteName);
  }

  static replaceTo( String ruteName ) {
    navigatorKey.currentState!.pushReplacementNamed(ruteName);
  }

}