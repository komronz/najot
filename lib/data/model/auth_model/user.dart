///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class User {
  int? id;
  String? phone;
  String? firstName;
  String? lastName;
  String? gender;
  String? photo;
  String? status;
  bool? isVolunteer;

  User({
    this.id,
    this.phone,
    this.firstName,
    this.lastName,
    this.gender,
    this.photo,
    this.status,
    this.isVolunteer,
  });
  User.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    phone = json['phone']?.toString();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    gender = json['gender']?.toString();
    photo = json['photo']?.toString();
    status = json['status']?.toString();
    isVolunteer = json['is_volunteer'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['photo'] = photo;
    data['status'] = status;
    data['is_volunteer'] = isVolunteer;
    return data;
  }
}
