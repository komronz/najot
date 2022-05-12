class TokenModel {
  String? expiry;
  String? token;

  TokenModel({this.expiry, this.token});

  TokenModel.fromJson(Map<String, dynamic> json) {
    expiry = json['expiry'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiry'] = this.expiry;
    data['token'] = this.token;
    return data;
  }
}
