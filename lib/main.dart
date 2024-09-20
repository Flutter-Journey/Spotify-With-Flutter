import 'package:flutter/material.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_theme.dart';
import 'package:spotify_with_flutter/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
