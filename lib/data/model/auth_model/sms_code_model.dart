class SmsCodeModel {
  String? codeToken;
  String? code;

  SmsCodeModel({
    this.codeToken,
    this.code,
  });

  SmsCodeModel.fromJson(Map<String, dynamic> json) {
    codeToken = json['code_token']?.toString();
    code = json['code']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code_token'] = codeToken;
    data['code'] = code;
    return data;
  }
}
