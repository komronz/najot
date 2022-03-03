import 'package:flutter/material.dart';

import '../bloc/theme_cubit/theme_cubit.dart';
import 'app_theme_color.dart';

class AppColors {
  // Color Names: Color names must be private
  static AppThemeColor _MAIN = AppThemeColor(
    lightColor: Colors.black,
  );

  static AppThemeColor _BACKGROUND = AppThemeColor(
    lightColor: Color(0xffF9F9F9),
  );

  static AppThemeColor _BORDER_GREY = AppThemeColor(
    lightColor: Color(0xffE7E7E7),
  );

  static AppThemeColor _BLUE = AppThemeColor(
    lightColor: Color(0xff1C84FF),
  );

  static AppThemeColor _TEXT_GREY = AppThemeColor(
    lightColor: Colors.black38,
  );

  static AppThemeColor _WHITE = AppThemeColor(
    lightColor: Colors.white,
    darkColor: Colors.white,
  );

  static AppThemeColor _BLACK = AppThemeColor(
    lightColor: Colors.black,
    darkColor: Colors.black,
  );

  static AppThemeColor _GREY = AppThemeColor(
    lightColor: Color(0xFFB1B1B1),
  );

  static AppThemeColor _PURPLE = AppThemeColor(
    lightColor: Color(0xFFF30B43),
  );

  static AppThemeColor _LIGHT_PURPLE = AppThemeColor(
    lightColor: Color(0xFFF0184C),
  );

  static AppThemeColor _DARK_GREY = AppThemeColor(
    lightColor: Color(0xFF858585),
  );

  static AppThemeColor _COURSE_IMAGE_BG_COLOR = AppThemeColor(
    lightColor: Color(0xFFF0F0F0),
  );

  static AppThemeColor _DISCOUNT_BG = AppThemeColor(
    lightColor: Color(0xFFF5C92A),
  );
  static AppThemeColor _YELLOW_BG = AppThemeColor(
    lightColor: Color(0xFFF4C10C),
  );
  static AppThemeColor _GREEN = AppThemeColor(
    lightColor: Color(0xFF00B533),
  );
  static AppThemeColor _RED = AppThemeColor(
    lightColor: Color(0xFFF30B43),
  );
  static AppThemeColor _LIGHT_GREY = AppThemeColor(
    lightColor: Color(0xFFE1E1E1),
  );
  static AppThemeColor _FORUM_WARING_BG = AppThemeColor(
    lightColor: Color(0xFFF0F9EB),
  );

  static AppThemeColor _LIGHT_ORANGE = AppThemeColor(
    lightColor: Color(0xFFfcf5eb),
  );

  static AppThemeColor _DARK_ORANGE = AppThemeColor(
    lightColor: Color(0xFFda9b35),
  );
  static AppThemeColor _STROKE_GREY = AppThemeColor(
    lightColor: Color(0xFFE6E6E6),
  );
  static AppThemeColor _GOLD = AppThemeColor(
    lightColor: Color(0xFFDDB00F),
  );

  // Colors for public usage
  static Color MAIN = AppColors._MAIN.get(_themeMode);

  static Color WHITE = AppColors._WHITE.get(_themeMode);

  static Color BLACK = AppColors._BLACK.get(_themeMode);

  static Color BACKGROUND = AppColors._BACKGROUND.get(_themeMode);

  static Color BORDER_GREY = AppColors._BORDER_GREY.get(_themeMode);

  static Color TEXT_GREY = AppColors._TEXT_GREY.get(_themeMode);

  static Color BLUE = AppColors._BLUE.get(_themeMode);

  static Color GREY = AppColors._GREY.get(_themeMode);

  static Color PURPLE = AppColors._PURPLE.get(_themeMode);

  static Color DARK_GREY = AppColors._DARK_GREY.get(_themeMode);

  static Color COURSE_IMAGE_BG_COLOR =
      AppColors._COURSE_IMAGE_BG_COLOR.get(_themeMode);
  static Color DISCOUNT_BG = AppColors._DISCOUNT_BG.get(_themeMode);
  static Color GREEN = AppColors._GREEN.get(_themeMode);
  static Color YELLOW_BG = AppColors._YELLOW_BG.get(_themeMode);
  static Color RED = AppColors._RED.get(_themeMode);
  static Color LIGHT_GREY = AppColors._LIGHT_GREY.get(_themeMode);
  static Color LIGHT_PURPLE = AppColors._LIGHT_PURPLE.get(_themeMode);
  static Color FORUM_WARING_BG = AppColors._FORUM_WARING_BG.get(_themeMode);
  static Color LIGHT_ORANGE = AppColors._LIGHT_ORANGE.get(_themeMode);
  static Color DARK_ORANGE = AppColors._DARK_ORANGE.get(_themeMode);
  static Color STROKE_GREY = AppColors._STROKE_GREY.get(_themeMode);
  static Color GOLD = AppColors._GOLD.get(_themeMode);

  static ThemeMode get _themeMode => ThemeCubit.to.state.themeMode;
}
