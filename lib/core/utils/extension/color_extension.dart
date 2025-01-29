import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color get determineTextColor =>
      computeLuminance() > 0.5 ? Colors.black : Colors.white;

  Color shade(int value, {bool darker = false}) => Color.alphaBlend(
      darker ? Colors.black.withAlpha(value) : Colors.white.withAlpha(value),
      this);
}
