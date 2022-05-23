class RegModel {
  String? detail;
  String? codeToken;

  RegModel({
    this.detail,
    this.codeToken,
  });

  RegModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail']?.toString();
    codeToken = json['code_token']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['detail'] = detail;
    data['code_token'] = codeToken;
    return data;
  }
}
