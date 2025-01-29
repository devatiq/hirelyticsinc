import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  //AppLocalizations? get language => AppLocalizations.of(this);

  //bool get isBangla => Localizations.localeOf(this).languageCode == 'bn';

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  bool get isDark => theme.brightness == Brightness.dark;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

// ThemeMode get themeMode => mediaQuery.platformBrightness == Brightness.light
//     ? ThemeMode.light
//     : ThemeMode.dark;

// Brightness get statusBarBrightness =>
//     themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark;

// MediaQueryData get mediaQuery => MediaQuery.of(this);
//
// Size get size => mediaQuery.size;
//
// double get height => size.height;
//
// double get width => size.width;

// Future<bool> setLastLatLng(LatLng loc) async => await location
//     .saveLastLocation(latitude: loc.latitude, longitude: loc.longitude);
}
