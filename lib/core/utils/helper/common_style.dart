import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/theme/app_colors.dart';


abstract class CommonStyle {
  static List<BoxShadow> boxShadow(
          {Color? color,
          double? colorOpacity,
          double? blurRadius,
          double? spreadRadius,
          BlurStyle blurStyle = BlurStyle.outer,
          Offset? offset,
          List<BoxShadow>? customShadow}) =>
      customShadow ??
      [
        BoxShadow(
            color: color?.withOpacity(colorOpacity ?? 1) ??
                Colors.black.withOpacity(colorOpacity ?? 0.2),
            spreadRadius: spreadRadius ?? 0,
            blurStyle: blurStyle,
            blurRadius: blurRadius ?? 4,
            offset: offset ?? Offset.zero)
      ];

  static void blackAppBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.colorBlack,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  static VisualDensity get minimumVisualDensity => const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity);

  void whiteAppBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.colorWhite,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
}
