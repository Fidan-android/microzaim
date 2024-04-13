import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository/theme_repository.dart';

part 'theme_state.g.dart';

class ThemeState = ThemeStateBase with _$ThemeState;

abstract class ThemeStateBase with Store {
  ThemeStateBase(this._themeRepository);

  final ThemeRepository _themeRepository;

  ThemeData get lightTheme => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        splashColor: const Color(0xFFBCFE2B),
        primaryTextTheme: TextTheme(
          bodySmall: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          bodyMedium: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        /*bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorLibrary.gray,
          selectedItemColor: ColorLibrary.blue,
          unselectedItemColor: ColorLibrary.gray,
          elevation: 0,
        ),*/
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  ThemeData get darkTheme => ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.white,
    splashColor: const Color(0xFFBCFE2B),
    primaryTextTheme: TextTheme(
      bodySmall: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      bodyMedium: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
    /*bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorLibrary.gray,
          selectedItemColor: ColorLibrary.blue,
          unselectedItemColor: ColorLibrary.gray,
          elevation: 0,
        ),*/
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  Future<ThemeData> _getTheme() async {
    final String? themeKey = await _themeRepository.getThemeKey();

    if (themeKey == null) {
      await _themeRepository.setThemeKey(lightTheme.brightness);

      return lightTheme;
    } else {
      return themeKey == "light" ? lightTheme : darkTheme;
    }
  }

  Future<ThemeData> _toggleTheme(ThemeData? theme) async {
    if (theme == lightTheme) {
      theme = darkTheme;
    } else {
      theme = lightTheme;
    }

    await _themeRepository.setThemeKey(theme.brightness);
    return theme;
  }

  @computed
  bool get isDark => theme?.brightness == Brightness.dark;

  @observable
  ThemeData? theme;

  @action
  Future<void> getTheme() async {
    theme = lightTheme;
    theme = await _getTheme();
  }

  @action
  Future<void> toggleTheme() async {
    theme = await _toggleTheme(theme);
  }
}
