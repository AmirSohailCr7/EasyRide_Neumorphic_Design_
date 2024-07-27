import 'package:flutter/material.dart';
import 'package:neumorphicloginui/utils/common/constants/kThemeConstants.dart';
import 'package:neumorphicloginui/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
