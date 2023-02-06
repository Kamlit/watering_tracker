import 'package:drink_tracker/presentation/screens/home/home_screen.dart';
import 'package:drink_tracker/presentation/screens/login/login_screen.dart';
import 'package:drink_tracker/presentation/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String splashScreen = '/splash';

  static Map<String, Widget Function(BuildContext)> routes = {
    homeScreen: (_) => const HomeScreen(),
    loginScreen: (_) => const LoginScreen(),
    splashScreen: (_) => const LoadingScreen(),
  };
}
