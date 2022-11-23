import 'package:flutter/material.dart';

class AppThemeColor {
  final Color lightColor;
  final Color? darkColor;

  AppThemeColor({
    required this.lightColor,
    this.darkColor,
  });

  Color get(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      return darkColor ?? lightColor;
    }
    return lightColor;
  }
}
