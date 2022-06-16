class LoginEndModel {
  String? refresh;
  String? access;
  UserModel? user;

  LoginEndModel({this.refresh, this.access, this.user});

  LoginEndModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserModel {
  int? id;
  String? phone;
  String? firstName;
  String? lastName;

  UserModel({this.id, this.phone, this.firstName, this.lastName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
