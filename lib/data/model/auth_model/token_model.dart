
class TokenModel {
  String? token;

  TokenModel({this.token});

  TokenModel.fromJson(Map<String, dynamic> json) {

    token = json['code_token'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}

class ConfirmNumberModel {
  bool? isExists;

  ConfirmNumberModel({this.isExists});

  ConfirmNumberModel.fromJson(Map<String, dynamic> json) {
    isExists = json['isExists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isExists'] = this.isExists;
    return data;
  }
}