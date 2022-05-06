class ProjectModel {
  int? owner;
  String? type;
  String? title;
  String? description;
  String? cover;
  String? deadline;
  int? requiredFund;
  String? helpType;
  String? address;
  String? createdAt;

  ProjectModel(
      {this.owner,
        this.type,
        this.title,
        this.description,
        this.cover,
        this.deadline,
        this.requiredFund,
        this.helpType,
        this.address,
        this.createdAt});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    cover = json['cover'];
    deadline = json['deadline'];
    requiredFund = json['required_fund'];
    helpType = json['help_type'];
    address = json['address'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['owner'] = this.owner;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['cover'] = this.cover;
    data['deadline'] = this.deadline;
    data['required_fund'] = this.requiredFund;
    data['help_type'] = this.helpType;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    return data;
  }
}