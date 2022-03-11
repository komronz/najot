class User {
  String? firstName;
  String? lastName;
  String? phone;

  User({
    this.firstName,
    this.lastName,
    this.phone,
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    phone = json['phone']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    return data;
  }
}
