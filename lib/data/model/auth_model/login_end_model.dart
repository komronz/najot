import 'package:najot/data/model/auth_model/user.dart';


class LoginEndModel {
  String? refresh;
  String? access;
  String? exp;

  LoginEndModel({this.refresh, this.access, this.exp});

  LoginEndModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    data['exp'] = this.exp;
    return data;
  }
}

class UserModel {
  int? id;
  String? phone;
  String? firstName;
  String? lastName;

  UserModel({this.id, this.phone, this.firstName, this.lastName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
