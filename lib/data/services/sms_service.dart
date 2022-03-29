import 'package:najot/data/model/sms_model.dart';

class SmsService {
  Future<List<SmsModel>?>? getSmsList() async {
    var list = [
      SmsModel(
        dateTime: DateTime.now(),
        text: "Assalomu aleykum, Manda volonyorlik bo’yicha savol bor edi.",
        type: SmsType.USER,
      ),
      SmsModel(
        dateTime: DateTime.now(),
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
        type: SmsType.OPERATOR,
      ),
    ];
    return list;
  }
}
