import 'package:drink_tracker/presentation/screens/home/home_screen.dart';
import 'package:drink_tracker/presentation/screens/login/login_screen.dart';
import 'package:drink_tracker/presentation/screens/saved_values/saved_values_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String savedValuesScreen = '/saved_values';

  static Map<String, Widget Function(BuildContext)> routes = {
    homeScreen: (_) => const HomeScreen(),
    loginScreen: (_) => const LoginScreen(),
    savedValuesScreen: (_) => const SavedValuesScreen(),
  };
}
