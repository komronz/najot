class AboutUs {
  int? id;
  String? name;
  String? phoneNumber;
  String? content;

  AboutUs({
    this.id,
    this.name,
    this.phoneNumber,
    this.content,
  });
  AboutUs.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    phoneNumber = json['phone']?.toString();
    content = json['content']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phoneNumber;
    data['content'] = content;
    return data;
  }
}
