class AddProjectModel {
  int? id;
  AddUser? user;
  String? whoAdd;
  String? name;
  String? type;
  String? description;

  AddProjectModel(
      {this.id,
        this.user,
        this.whoAdd,
        this.name,
        this.type,
        this.description});

  AddProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new AddUser.fromJson(json['user']) : null;
    whoAdd = json['who_add'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['who_add'] = this.whoAdd;
    data['name'] = this.name;
    data['type'] = this.type;
    data['description'] = this.description;
    return data;
  }
}

class AddUser {
  int? id;
  String? firstName;
  String? lastName;
  String? photo;

  AddUser({this.id, this.firstName, this.lastName, this.photo});

  AddUser.fromJson(Map<String, dynamic> json) {
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
