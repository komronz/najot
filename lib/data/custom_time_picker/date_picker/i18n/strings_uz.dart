part of 'date_picker_i18n.dart';

/// Russian (RU)
class _StringsUz extends _StringsI18n {
  const _StringsUz();

  @override
  String getCancelText() {
    return "Bekor qilish";
  }

  @override
  String getDoneText() {
    return "Bajarildi";
  }

  @override
  List<String> getMonths() {
    return [
      "Yanvar",
      "Fevral",
      "Mart",
      "April",
      "May",
      "Iyun",
      "Iyul",
      "Avgust",
      "Sentyabr",
      "Oktyabr",
      "Noyabr",
      "Dekabr"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Dushanba",
      "Seshanba",
      "Chorshanba",
      "Payshanba",
      "Juma",
      "Shanba",
      "Yakshanba",
    ];
  }

  @override
  List<String>? getWeeksShort() {
    return null;
  }
}
