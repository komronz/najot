import 'package:equatable/equatable.dart';

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

class ProjectModel extends Equatable{
  int? id;
  Owner? owner;
  List<CardModel?>? cards;
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
  bool? isFavourite;
  bool? isContribution;
  String? createdAt;
  String? modifiedAt;

  ProjectModel({
    this.id,
    this.owner,
    this.cards,
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
    this.isContribution,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    if (json['cards'] != null) {
      final v = json['cards'];
      final arr0 = <CardModel>[];
      v.forEach((v) {
        arr0.add(CardModel.fromJson(v));
      });
      cards = arr0;
    }
    type = json['type'];
    title = json['title'];
    helpType = json['help_type'];
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
    deadline = json['deadline'];
    cover = json['cover'];
    content = json['content'];
    coverUrl = json['cover_url'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    investorsCount = json['investors_count'];
    amountCollected = json['amount_collected'];
    percent = json['percent'];
    cardNumber = json['card_number'];
    requiredFund = json['required_fund'];
    address = json['address'];
    isFavourite = json['is_favourite'];
    isContribution = json['is_contribution'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    if (cards != null) {
      final v = cards;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['cards'] = arr0;
    }
    data['type'] = this.type;
    data['title'] = this.title;
    data['help_type'] = this.helpType;
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    data['deadline'] = this.deadline;
    data['cover'] = this.cover;
    data['content'] = this.content;
    data['cover_url'] = this.coverUrl;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['investors_count'] = this.investorsCount;
    data['amount_collected'] = this.amountCollected;
    data['percent'] = this.percent;
    data['card_number'] = this.cardNumber;
    data['required_fund'] = this.requiredFund;
    data['address'] = this.address;
    data['is_favourite'] = this.isFavourite;
    data['is_contribution'] = this.isContribution;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isFavourite];
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

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CardModelCardType {
/*
{
  "id": 1,
  "name": "HUMO",
  "image": "https://api.najot.uz/media/card-image/channels4_profile.jpg"
}
*/

  int? id;
  String? name;
  String? image;

  CardModelCardType({
    this.id,
    this.name,
    this.image,
  });
  CardModelCardType.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class CardModel {
/*
{
  "id": 1,
  "name": "HUMO",
  "card_type": {
    "id": 1,
    "name": "HUMO",
    "image": "https://api.najot.uz/media/card-image/channels4_profile.jpg"
  },
  "card_number": "0970 3322 2383 3221  0970 3322 2383 3221",
  "full_name": "Mujohiddin Kamolov"
}
*/

  int? id;
  String? name;
  CardModelCardType? cardType;
  String? cardNumber;
  String? fullName;

  CardModel({
    this.id,
    this.name,
    this.cardType,
    this.cardNumber,
    this.fullName,
  });
  CardModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    cardType = (json['card_type'] != null) ? CardModelCardType.fromJson(json['card_type']) : null;
    cardNumber = json['card_number']?.toString();
    fullName = json['full_name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (cardType != null) {
      data['card_type'] = cardType!.toJson();
    }
    data['card_number'] = cardNumber;
    data['full_name'] = fullName;
    return data;
  }
}

