import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData appThemeLight = _buildThemeLight();
  static ThemeData appThemeDark = _buildThemeDark();

  static ThemeData _buildThemeDark() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return ThemeData(
        textTheme: _buildTextTheme(),
        useMaterial3: true,
        colorScheme: ColorScheme.dark());
  }

  static ThemeData _buildThemeLight() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: _buildTextTheme(),
        colorScheme: const ColorScheme.light(
            primary: AppColors.colorAppBlue,
            onPrimary: AppColors.colorWhite,
            secondary: AppColors.colorAppGreen,
            onSecondary: AppColors.colorWhite,
            surface: Color(0xffeef6ff),
            onSurface: AppColors.colorAppGreenDark,
            error: Colors.red,
            onError: Colors.white));
  }

  static final TextTheme _appFont = GoogleFonts.ralewayTextTheme();

  static TextTheme _buildTextTheme() {
    return _appFont;
  }
}
