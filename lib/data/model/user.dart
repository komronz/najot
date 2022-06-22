import 'package:najot/data/utils/app_utils.dart';

class User {
  String? firstName;
  String? lastName;
  String? phone;
  String? imageUrl;
  Gender? isMan;

  User({this.firstName, this.lastName, this.phone, this.imageUrl, this.isMan});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    phone = json['phone']?.toString();
    imageUrl = json['imageUrl']?.toString();
    isMan = genderFromJson(json['isMan']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['imageUrl'] = imageUrl;
    data['isMan'] = genderToJson();
    return data;
  }

  String? genderToJson() {
    if (isMan == null) return null;
    if (isMan == Gender.man) return "man";
    return "woman";
  }

  static Gender? genderFromJson(String? value) {
    if (value == null) return null;
    if (value == "man") return Gender.man;
    return Gender.woman;
  }
}
