class SmsModel {
  final String? text;
  final DateTime? dateTime;
  final SmsType? type;

  SmsModel({
    this.text,
    this.dateTime,
    this.type,
  });
}

enum SmsType {
  user,
  operator,
}
