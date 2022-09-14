import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:najot/data/model/language_item.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../localization/locale_keys.g.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  static LanguageCubit get to => GetIt.I<LanguageCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<LanguageCubit>(LanguageCubit());
  }

  LanguageCubit()
      : super(
          LanguageState(
            locale: Locale('uz', 'UZ'),
          ),
        );

  void change(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  static String getLang() {
    var locale;
    if (LanguageCubit.to.state.locale == Locale("uz", "UZ")) {
      locale = "uz";
    } else if (LanguageCubit.to.state.locale == Locale("ky", "KG")) {
      // O'zgartishi kerak => ky
      locale = "uz";
    } else if (LanguageCubit.to.state.locale == Locale("ru", "RU")) {
      locale = "ru";
    }

    return locale;
  }

  final List<LanguageItem> languages = [
    LanguageItem(
      languageLocaleKey: LocaleKeys.str_uzbek,
      locale: Locale('uz', 'UZ'),
    ),
    LanguageItem(
      languageLocaleKey: LocaleKeys.str_uzbek,
      locale: Locale("ky", "KG"),
    ),
    LanguageItem(
      languageLocaleKey: LocaleKeys.str_russian,
      locale: Locale('ru', 'RU'),
    ),
  ];

  void changeValue(int value) {
    emit(state.copyWith(value: value));
  }

  Future changeLanguage(Locale locale) async {
    if (!await checkConnection()) {
      AppWidgets.showText(text: tr(LocaleKeys.app_name));
      return;
    }

    emit(state.copyWith(isLoading: true));

    emit(state.copyWith(isLoading: false));
    NavigatorService.to.pop();
  }

  String getLanguageLocaleKey(String languageCode) {
    return languages
        .firstWhere(
          (element) => element.locale.languageCode == languageCode,
        )
        .languageLocaleKey;
  }

  Future<bool> checkConnection() async {
    var connectivity = Connectivity();
    var result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageState(locale: (json['locale'] as String).toLocale());
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return {
      'locale': "${state.locale.languageCode}_${state.locale.countryCode}",
    };
  }
}
