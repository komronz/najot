class ProjectModel {
  int? owner;
  String? type;
  String? title;
  String? description;
  String? cover;
  String? deadline;
  Null category;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['owner'] = this.owner;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['cover'] = this.cover;
    data['deadline'] = this.deadline;
    data['category'] = this.category;
    data['person'] = this.person;
    data['required_fund'] = this.requiredFund;
    data['help_type'] = this.helpType;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    return data;
  }
}
