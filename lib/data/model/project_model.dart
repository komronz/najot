class ProjectModel {
  int? owner;
  String? type;
  String? title;
  String? description;
  String? cover;
  String? deadline;
  Object? category;
  int? person;
  int? requiredFund;
  String? helpType;
  String? address;
  String? createdAt;
  String? modifiedAt;

  ProjectModel(
      {this.owner,
      this.type,
      this.title,
      this.description,
      this.cover,
      this.deadline,
      this.category,
      this.person,
      this.requiredFund,
      this.helpType,
      this.address,
      this.createdAt,
      this.modifiedAt});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    cover = json['cover'];
    deadline = json['deadline'];
    category = json['category'];
    person = json['person'];
    requiredFund = json['required_fund'];
    helpType = json['help_type'];
    address = json['address'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owner'] = owner;
    data['type'] = type;
    data['title'] = title;
    data['description'] = description;
    data['cover'] = cover;
    data['deadline'] = deadline;
    data['category'] = category;
    data['person'] = person;
    data['required_fund'] = requiredFund;
    data['help_type'] = helpType;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['modified_at'] = modifiedAt;
    return data;
  }
}
