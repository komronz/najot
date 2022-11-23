class BlockedModel {
  String? detail;
  int? retryAfter;

  BlockedModel({this.detail, this.retryAfter});

  BlockedModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    retryAfter = json['retry_after'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['retry_after'] = this.retryAfter;
    return data;
  }
}