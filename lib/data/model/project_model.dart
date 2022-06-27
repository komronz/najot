class Category {
  int? id;
  String? name;
  String? type;
  String? photo;

  Category({
    this.id,
    this.name,
    this.type,
    this.photo,
  });
  Category.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    type = json['type']?.toString();
    photo = json['photo']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['photo'] = photo;
    return data;
  }
}

class Organization {

  int? id;
  String? name;

  Organization({
    this.id,
    this.name,
  });
  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Owner {
  int? id;
  String? firstName;
  String? lastName;
  String? photo;

  Owner({
    this.id,
    this.firstName,
    this.lastName,
    this.photo,
  });
  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    photo = json['photo']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['photo'] = photo;
    return data;
  }
}
class ProjectModel {
  int? id;
  Owner? owner;
  String? type;
  String? title;
  String? helpType;
  Organization? organization;
  String? deadline;
  String? cover;
  String? content;
  String? coverUrl;
  Category? category;
  int? investorsCount;
  String? amountCollected;
  int? percent;
  String? cardNumber;
  String? requiredFund;
  String? address;
  String? isFavourite;
  String? createdAt;
  String? modifiedAt;

  ProjectModel({
    this.id,
    this.owner,
    this.type,
    this.title,
    this.helpType,
    this.organization,
    this.deadline,
    this.cover,
    this.content,
    this.coverUrl,
    this.category,
    this.investorsCount,
    this.amountCollected,
    this.percent,
    this.cardNumber,
    this.requiredFund,
    this.address,
    this.isFavourite,
    this.createdAt,
    this.modifiedAt,
  });
  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    owner = (json['owner'] != null) ? Owner.fromJson(json['owner']) : null;
    type = json['type']?.toString();
    title = json['title']?.toString();
    helpType = json['help_type']?.toString();
    organization = (json['organization'] != null) ? Organization.fromJson(json['organization']) : null;
    deadline = json['deadline']?.toString();
    cover = json['cover']?.toString();
    content = json['content']?.toString();
    coverUrl = json['cover_url']?.toString();
    category = (json['category'] != null) ? Category.fromJson(json['category']) : null;
    investorsCount = json['investors_count']?.toInt();
    amountCollected = json['amount_collected']?.toString();
    percent = json['percent']?.toInt();
    cardNumber = json['card_number']?.toString();
    requiredFund = json['required_fund']?.toString();
    address = json['address']?.toString();
    isFavourite = json['is_favourite']?.toString();
    createdAt = json['created_at']?.toString();
    modifiedAt = json['modified_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['type'] = type;
    data['title'] = title;
    data['help_type'] = helpType;
    if (organization != null) {
      data['organization'] = organization!.toJson();
    }
    data['deadline'] = deadline;
    data['cover'] = cover;
    data['content'] = content;
    data['cover_url'] = coverUrl;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['investors_count'] = investorsCount;
    data['amount_collected'] = amountCollected;
    data['percent'] = percent;
    data['card_number'] = cardNumber;
    data['required_fund'] = requiredFund;
    data['address'] = address;
    data['is_favourite'] = isFavourite;
    data['created_at'] = createdAt;
    data['modified_at'] = modifiedAt;
    return data;
  }
}
class ProjectModelLinks {

  String? next;
  String? previous;

  ProjectModelLinks({
    this.next,
    this.previous,
  });
  ProjectModelLinks.fromJson(Map<String, dynamic> json) {
    next = json['next']?.toString();
    previous = json['previous']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['next'] = next;
    data['previous'] = previous;
    return data;
  }
}




