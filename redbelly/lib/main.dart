import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redbelly',
      theme: theme,
      home: const SplashScreen(),
    );
  }
}
