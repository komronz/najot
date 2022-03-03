import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.inter().fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.inter().fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
