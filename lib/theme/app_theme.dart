import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xff192739), // Choose your primary color
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurple,
    brightness: Brightness.dark,
  );
}
