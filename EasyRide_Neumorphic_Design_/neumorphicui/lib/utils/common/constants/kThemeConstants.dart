import 'package:flutter/material.dart';
import 'package:neumorphicloginui/utils/common/constants/kColors.dart';

const fontFamily = 'QuickSand';

ThemeData theme(
    {Color color = btnTextColor,
    String? fntFamily = fontFamily,
    FontWeight fontwght = FontWeight.normal}) {
  return ThemeData(
    dialogBackgroundColor: whiteColor,
    useMaterial3: true,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontFamily: fntFamily,
          fontSize: 36,
          fontWeight: fontwght,
          color: color),
      headlineMedium: TextStyle(
          fontFamily: fntFamily,
          fontSize: 32,
          fontWeight: fontwght,
          color: color),
      headlineSmall: TextStyle(
          fontFamily: fntFamily,
          fontSize: 24,
          fontWeight: fontwght,
          color: color),
      displayLarge: TextStyle(
          fontFamily: fntFamily,
          fontSize: 18,
          fontWeight: fontwght,
          color: color),
      displayMedium: TextStyle(
          fontFamily: fntFamily,
          fontSize: 14,
          fontWeight: fontwght,
          color: color),
      displaySmall: TextStyle(
          fontFamily: fntFamily,
          fontSize: 12,
          fontWeight: fontwght,
          color: color),
      bodyLarge: TextStyle(
          fontFamily: fntFamily,
          fontSize: 14,
          fontWeight: fontwght,
          color: color),
      bodyMedium: TextStyle(
          fontFamily: fntFamily,
          fontSize: 12,
          fontWeight: fontwght,
          color: color),
    ),
  );
}
