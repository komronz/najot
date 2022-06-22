import 'dart:math';

part 'strings_en_us.dart';
part 'strings_ru.dart';
part 'strings_uz.dart';

abstract class _StringsI18n {
  const _StringsI18n();

  /// Get the done widgets text
  String getDoneText();

  /// Get the cancel widgets text
  String getCancelText();

  /// Get the name of month
  List<String> getMonths();

  /// Get the full name of week
  List<String> getWeeksFull();

  /// Get the short name of week
  List<String>? getWeeksShort();
}

enum DateTimePickerLocale {
  /// English (EN) United States
  enUs,

  /// Chinese (ZH) Simplified
  zhCn,

  /// Portuguese (PT) Brazil
  ptBr,

  /// Spanish (ES)
  uz,

  /// Romanian (RO)
  ro,

  /// Bengali (BN)
  bn,

  /// Arabic (AR)
  ar,

  /// Japanese (JP)
  jp,

  /// Russian (RU)
  ru,

  /// German (DE)
  de,

  /// Korea (KO)
  ko,

  /// Italian (IT)
  it,

  /// Hungarian (HU)
  hu,

  /// Hebrew (HE)
  he,

  /// Indonesian (ID)
  id,

  /// Turkish (TR)
  tr,

  /// Norwegian Bokmål (NO)
  noNb,

  /// Norwegian Nynorsk (NO)
  noNn,

  /// French (FR)
  fr,

  /// Thai (TH)
  th,

  /// Lithuaniana (LT)
  lt,

  /// Dutch (NL)
  nl,

  /// Haitian Creole (HT)
  ht,
}

/// Default value of date locale
const DateTimePickerLocale datetimePickerLocaleDefault =
    DateTimePickerLocale.enUs;

// ignore: library_private_types_in_public_api
const Map<DateTimePickerLocale, _StringsI18n> datePickerI18n = {
  DateTimePickerLocale.ru: _StringsRu(),
  DateTimePickerLocale.uz: _StringsUz(),
  DateTimePickerLocale.enUs: _StringsEnUs(),
};

class DatePickerI18n {
  /// Get done button text
  static String getLocaleDone(DateTimePickerLocale locale) {
    _StringsI18n i18n =
        datePickerI18n[locale] ?? datePickerI18n[datetimePickerLocaleDefault]!;
    return i18n.getDoneText();
  }

  /// Get cancel button text
  static String getLocaleCancel(DateTimePickerLocale locale) {
    _StringsI18n i18n =
        datePickerI18n[locale] ?? datePickerI18n[datetimePickerLocaleDefault]!;
    return i18n.getCancelText();
  }

  /// Get locale month array
  static List<String> getLocaleMonths(DateTimePickerLocale? locale) {
    _StringsI18n i18n =
        datePickerI18n[locale!] ?? datePickerI18n[datetimePickerLocaleDefault]!;
    List<String> months = i18n.getMonths();
    if (months.isNotEmpty) {
      return months;
    }
    return datePickerI18n[datetimePickerLocaleDefault]!.getMonths();
  }

  /// Get locale week array
  static List<String>? getLocaleWeeks(DateTimePickerLocale? locale,
      [bool isFull = true]) {
    _StringsI18n? i18n =
        datePickerI18n[locale!] ?? datePickerI18n[datetimePickerLocaleDefault];
    if (isFull) {
      List<String> weeks = i18n!.getWeeksFull();
      if (weeks.isNotEmpty) {
        return weeks;
      }
      return datePickerI18n[datetimePickerLocaleDefault]!.getWeeksFull();
    }

    List<String>? weeks = i18n!.getWeeksShort();
    if (weeks != null && weeks.isNotEmpty) {
      return weeks;
    }

    List<String> fullWeeks = i18n.getWeeksFull();
    if (fullWeeks.isNotEmpty) {
      return fullWeeks
          .map((item) => item.substring(0, min(3, item.length)))
          .toList();
    }
    return datePickerI18n[datetimePickerLocaleDefault]!.getWeeksShort();
  }
}
