import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static TextStyle titleTextStyle(BuildContext context,
          {required double fontSize, Color? color}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      );

  static TextStyle subtitleTextStyle(BuildContext context,
          {required double fontSize, Color? color}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: color,
        fontFamily: GoogleFonts.raleway().fontFamily,
      );
}
