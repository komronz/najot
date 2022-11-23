import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  static ThemeCubit get to => GetIt.I<ThemeCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<ThemeCubit>(ThemeCubit());
  }

  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light));

  Future<void> setThemeMode(ThemeMode value) async {
    emit(state.copyWith(themeMode: value));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    ThemeMode themeMode = ThemeMode.light;
    switch (json['themeMode']) {
      case _AppThemeMode.light:
        themeMode = ThemeMode.light;
        break;
      case _AppThemeMode.dark:
        themeMode = ThemeMode.dark;
        break;
      case _AppThemeMode.system:
        themeMode = ThemeMode.system;
        break;
    }
    return ThemeState(themeMode: themeMode);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    Map<String, dynamic> json = {};
    switch (state.themeMode) {
      case ThemeMode.system:
        json['themeMode'] = _AppThemeMode.system;
        break;
      case ThemeMode.light:
        json['themeMode'] = _AppThemeMode.light;
        break;
      case ThemeMode.dark:
        json['themeMode'] = _AppThemeMode.dark;
        break;
    }
    return json;
  }
}

class _AppThemeMode {
  static const system = "system";
  static const light = "light";
  static const dark = "dark";
}
