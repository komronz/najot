import 'package:easy_localization/easy_localization.dart';

const List<String> status = ["All", "In progress", "Done"];

enum Gender { WOMAN, MAN }

class Format {
  static String moneyFormat(dynamic money) {
    if (money != null) {
      final formatCurrency = new NumberFormat.currency(
          locale: "uz_UZ", symbol: "so'm", decimalDigits: 0);
      return formatCurrency.format(money);
    }
    return '';
  }
}
