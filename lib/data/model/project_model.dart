

class ProjectModel {
  int? id;
  Owner? owner;
  String? type;
  String? title;
  bool? reaction;
  String? helpType;
  int? organization;
  String? deadline;
  String? cover;
  String? content;
  String? coverUrl;
  int? category;
  int? totalPeopleInvested;
  String? amountCollected;
  int? percent;
  String? cardNumber;
  String? requiredFund;
  String? address;
  String? createdAt;
  String? modifiedAt;

  ProjectModel(
      {this.id,
        this.owner,
        this.type,
        this.title,
        this.reaction,
        this.helpType,
        this.organization,
        this.deadline,
        this.cover,
        this.content,
        this.coverUrl,
        this.category,
        this.totalPeopleInvested,
        this.amountCollected,
        this.percent,
        this.cardNumber,
        this.requiredFund,
        this.address,
        this.createdAt,
        this.modifiedAt});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    type = json['type'];
    title = json['title'];
    reaction = json['reaction'];
    helpType = json['help_type'];
    organization = json['organization'];
    deadline = json['deadline'];
    cover = json['cover'];
    content = json['content'];
    coverUrl = json['cover_url'];
    category = json['category'];
    totalPeopleInvested = json['total_people_invested'];
    amountCollected = json['amount_collected'];
    percent = json['percent'];
    cardNumber = json['card_number'];
    requiredFund = json['required_fund'];
    address = json['address'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['type'] = this.type;
    data['title'] = this.title;
    data['reaction'] = this.reaction;
    data['help_type'] = this.helpType;
    data['organization'] = this.organization;
    data['deadline'] = this.deadline;
    data['cover'] = this.cover;
    data['content'] = this.content;
    data['cover_url'] = this.coverUrl;
    data['category'] = this.category;
    data['total_people_invested'] = this.totalPeopleInvested;
    data['amount_collected'] = this.amountCollected;
    data['percent'] = this.percent;
    data['card_number'] = this.cardNumber;
    data['required_fund'] = this.requiredFund;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    return data;
  }
}

class Owner {
  int? id;
  String? firstName;
  String? lastName;
  String? photo;

  Owner({this.id, this.firstName, this.lastName, this.photo});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['photo'] = this.photo;
    return data;
  }
}