

import 'auth_model/user.dart';

class VolunteerProfileModel {
  int? id;
  String? address;
  String? birthdate;
  String? passportSeries;
  String? passportNumber;
  String? givenByWhom;
  String? givenDate;
  String? passportFront;
  String? gender;
  String? passportBack;
  String? createdAt;
  String? modifiedAt;
  User? user;
  String? status;

  VolunteerProfileModel(
      {this.id,
        this.address,
        this.birthdate,
        this.passportSeries,
        this.passportNumber,
        this.givenByWhom,
        this.givenDate,
        this.passportFront,
        this.gender,
        this.passportBack,
        this.createdAt,
        this.modifiedAt,
        this.user,
        this.status});

  VolunteerProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    birthdate = json['birthdate'];
    passportSeries = json['passport_series'];
    passportNumber = json['passport_number'];
    givenByWhom = json['given_by_whom'];
    givenDate = json['given_date'];
    passportFront = json['passport_front'];
    gender = json['gender'];
    passportBack = json['passport_back'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['birthdate'] = this.birthdate;
    data['passport_series'] = this.passportSeries;
    data['passport_number'] = this.passportNumber;
    data['given_by_whom'] = this.givenByWhom;
    data['given_date'] = this.givenDate;
    data['passport_front'] = this.passportFront;
    data['gender'] = this.gender;
    data['passport_back'] = this.passportBack;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}