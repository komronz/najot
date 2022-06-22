import 'package:flutter/material.dart';

import '../bloc/theme_cubit/theme_cubit.dart';
import 'app_theme_color.dart';

class AppColors {
  // Color Names: Color names must be private
  static final AppThemeColor _main = AppThemeColor(
    lightColor: Colors.black,
  );

  static final AppThemeColor _background = AppThemeColor(
    lightColor: const Color(0xffF9F9F9),
  );

  static final AppThemeColor _borderGrey = AppThemeColor(
    lightColor: const Color(0xffE7E7E7),
  );

  static final AppThemeColor _blue = AppThemeColor(
    lightColor: const Color(0xff1C84FF),
  );

  static final AppThemeColor _textGrey = AppThemeColor(
    lightColor: Colors.black38,
  );

  static final AppThemeColor _white = AppThemeColor(
    lightColor: Colors.white,
    darkColor: Colors.white,
  );

  static final AppThemeColor _black = AppThemeColor(
    lightColor: Colors.black,
    darkColor: Colors.black,
  );

  static final AppThemeColor _grey = AppThemeColor(
    lightColor: const Color(0xFFB1B1B1),
  );

  static final AppThemeColor _purple = AppThemeColor(
    lightColor: const Color(0xFFF30B43),
  );

  static final AppThemeColor _lightPurple = AppThemeColor(
    lightColor: const Color(0xFFF0184C),
  );

  static final AppThemeColor _darkGrey = AppThemeColor(
    lightColor: const Color(0xFF858585),
  );

  static final AppThemeColor _courseImageBgColor = AppThemeColor(
    lightColor: const Color(0xFFF0F0F0),
  );

  static final AppThemeColor _discountBg = AppThemeColor(
    lightColor: const Color(0xFFF5C92A),
  );
  static final AppThemeColor _yellowBg = AppThemeColor(
    lightColor: const Color(0xFFF4C10C),
  );
  static final AppThemeColor _green = AppThemeColor(
    lightColor: const Color(0xFF00B533),
  );
  static final AppThemeColor _red = AppThemeColor(
    lightColor: const Color(0xFFF30B43),
  );
  static final AppThemeColor _lightGrey = AppThemeColor(
    lightColor: const Color(0xFFE1E1E1),
  );
  static final AppThemeColor _forumWaringBg = AppThemeColor(
    lightColor: const Color(0xFFF0F9EB),
  );

  static final AppThemeColor _lightOrange = AppThemeColor(
    lightColor: const Color(0xFFfcf5eb),
  );

  static final AppThemeColor _darkOrange = AppThemeColor(
    lightColor: const Color(0xFFda9b35),
  );
  static final AppThemeColor _strokeGrey = AppThemeColor(
    lightColor: const Color(0xFFE6E6E6),
  );
  static final AppThemeColor _gold = AppThemeColor(
    lightColor: const Color(0xFFDDB00F),
  );

  // Colors for public usage
  static Color main = AppColors._main.get(_themeMode);

  static Color white = AppColors._white.get(_themeMode);

  static Color black = AppColors._black.get(_themeMode);

  static Color background = AppColors._background.get(_themeMode);

  static Color borderGrey = AppColors._borderGrey.get(_themeMode);

  static Color textGrey = AppColors._textGrey.get(_themeMode);

  static Color blue = AppColors._blue.get(_themeMode);

  static Color grey = AppColors._grey.get(_themeMode);

  static Color purple = AppColors._purple.get(_themeMode);

  static Color darkGrey = AppColors._darkGrey.get(_themeMode);

  static Color courseImageBgColor =
      AppColors._courseImageBgColor.get(_themeMode);
  static Color discountBg = AppColors._discountBg.get(_themeMode);
  static Color green = AppColors._green.get(_themeMode);
  static Color yellowBg = AppColors._yellowBg.get(_themeMode);
  static Color red = AppColors._red.get(_themeMode);
  static Color lightGrey = AppColors._lightGrey.get(_themeMode);
  static Color lightPurple = AppColors._lightPurple.get(_themeMode);
  static Color forumWaringBg = AppColors._forumWaringBg.get(_themeMode);
  static Color lightOrange = AppColors._lightOrange.get(_themeMode);
  static Color darkOrange = AppColors._darkOrange.get(_themeMode);
  static Color strokeGrey = AppColors._strokeGrey.get(_themeMode);
  static Color gold = AppColors._gold.get(_themeMode);

  static ThemeMode get _themeMode => ThemeCubit.to.state.themeMode;
}
