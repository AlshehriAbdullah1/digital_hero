import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppThemeNotifier extends StateNotifier<ThemeData> {
  static ThemeData _initialTheme = ThemeData.light().copyWith(
    // primaryColor: const Color(0xff192739),

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      secondary: const Color(0xff6A2B52),
      primary: const Color(0xff192739),
      // secondary: const Color(0xff6A2B52),

      background: Colors.white,
      error: Colors.red,
      surface: Colors.grey,
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      onSecondary: Colors.white,
      onBackground: Colors.black,
      onError: Colors.white,
      onSurface: Color(0xff595959),
    ),

    // secondaryHeaderColor: const Color(0xff6A2B52),
    // brightness: Brightness.light,
  );

  final ThemeData _lightTheme = _initialTheme;
  final ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurple,
    brightness: Brightness.dark,
  );

  AppThemeNotifier() : super(_initialTheme);
  // default coloring is light (state value = true means light mode is on)

  void changeTheme() {
    isLight() ? state = _darkTheme : state = _lightTheme;
  }

  bool isLight() {
    return state == _lightTheme ? true : false;
  }
}

final appThemeProvider =
    StateNotifierProvider<AppThemeNotifier, ThemeData>((ref) {
  return AppThemeNotifier();
});
