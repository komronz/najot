class NumberChangeModel {
  bool? ok;
  String? detail;
  String? code;

  NumberChangeModel({this.ok, this.detail, this.code});

  NumberChangeModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    detail = json['detail'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['detail'] = this.detail;
    data['code'] = this.code;
    return data;
  }
}
