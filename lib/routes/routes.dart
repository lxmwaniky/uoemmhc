import 'package:flutter/material.dart';
import 'package:uoemmhc/screens/home_screen.dart';
import 'package:uoemmhc/screens/splash_screen.dart';

// This method holds all routes for easy management and navigation
class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
