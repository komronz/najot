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
      : super(LanguageState(
          locale: Locale('uz', 'UZ'),
        ));

  void change(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  final List<LanguageItem> languages = [
    LanguageItem(
      languageLocaleKey: LocaleKeys.str_uzbek,
      locale: Locale('uz', 'UZ'),
    ),
    LanguageItem(
      languageLocaleKey: LocaleKeys.str_russian,
      locale: Locale('ru', 'RU'),
    ),
  ];

  Future changeLanguage(Locale locale) async {
    if (!await checkConnection()) {
      AppWidgets.showText(text: tr(LocaleKeys.app_name));
      return;
    }

    emit(state.copyWith(isLoading: true));

    late String lang;

    switch (locale.languageCode) {
      case "uz":
        lang = "uz_latn";
        break;
      default:
        lang = "ru";
        break;
    }
    //
    // User? _user = await UserService.to.updateMe(
    //   {"lang": lang},
    // );
    // if (_user != null) {
    //   DBService.to.clearUser();
    //   DBService.to.saveUser(_user);
    //   UserCubit.to.load();
    //   change(locale);
    // } else {
    //   AppWidgets.showText(
    //     text: tr(LocaleKeys.str_smt_went_wrong_try_again),
    //   );
    // }

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
