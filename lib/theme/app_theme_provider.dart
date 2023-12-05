import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeNotifier extends StateNotifier<ThemeData> {
  // static ThemeData _initialTheme =
  // final ThemeData _lightTheme = _initialTheme;
  // final ThemeData _darkTheme = ThemeData.dark().copyWith(
  //   primaryColor: Colors.deepPurple,
  //   brightness: Brightness.dark,
  // );

  AppThemeNotifier() : super(lightTheme);
  // default coloring is light (state value = true means light mode is on)

  void changeTheme() async {
    if (isLight()) {
      state = darkTheme;
      // sharedPrefrences.setBool('isDark', true);
    } else {
      state = lightTheme;
      // sharedPrefrences.setBool('isDark', false);
    }
    // isLight() ? state = _darkTheme : state = _lightTheme;
  }

  bool isLight() {
    return state == lightTheme ? true : false;
  }
}

final appThemeProvider =
    StateNotifierProvider<AppThemeNotifier, ThemeData>((ref) {
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();
  late SharedPreferences sharedPreferences;

  // // Check the user's preference, defaulting to light theme if no preference is found
  // bool isDarkMode = sharedPreferences.getBool('isDark') ?? false;
  // ThemeData initialTheme = isDarkMode ? darkTheme : lightTheme;

  // Initialize the AppThemeNotifier with the obtained initialTheme
  return AppThemeNotifier();
});

final ThemeData lightTheme = ThemeData.light().copyWith(
  // primaryColor: const Color(0xff192739),

  colorScheme: ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xff192739),
    onPrimary: Colors.white,

    secondary: Color(0xff843667),
    onSecondary: Colors.white,

    background: Colors.white,
    onBackground: Colors.black,

    error: Colors.red,
    surface: Colors.grey,
    onError: Colors.white,
    onSurface: Color(0xff595959),
  ),

  // secondaryHeaderColor: const Color(0xff6A2B52),
  // brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xff192739),
    onPrimary: Colors.white,

    secondary: Color(0xff843667),
    onSecondary: Colors.white,

    background: Color(0xff2A2B2C),
    onBackground: Colors.white,

    error: Colors.red,
    surface: Color(0xff192739),
    onError: Colors.white,
    onSurface: Color(0xff595959),

  ),
);
