import 'package:flutter/material.dart';
import 'package:uoemmhc/routes/routes.dart';
import 'screens/splash_screen.dart';
import 'theme/themes.dart'; // Import the themes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uoemmhc',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
      home: const SplashScreen(),
    );
  }
}