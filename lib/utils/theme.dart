import 'package:flutter/material.dart';

abstract class Mytheme {
  static ThemeData maintheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff121312),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: Color(0xffB5B4B4),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      titleMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}
