import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/theme/app_colors.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static TextStyle titleTextStyle(BuildContext context,
          {required double fontSize,
          FontWeight? fontWeight,
          Color? color,
          String? fontFamily}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppColors.colorOnTitleText,
        letterSpacing: -0.3,
        fontFamily: fontFamily ?? GoogleFonts.montserrat().fontFamily,
      );

  static TextStyle subtitleTextStyle(BuildContext context,
          {required double fontSize,
          FontWeight? fontWeight,
          Color? color,
          String? fontFamily}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        letterSpacing: -0.3,
        color: color ?? AppColors.colorOnBodyText,
        fontFamily: fontFamily ?? GoogleFonts.raleway().fontFamily,
      );
}
