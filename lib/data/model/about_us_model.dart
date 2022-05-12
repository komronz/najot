import 'dart:convert';

AboutUs aboutUsFromJson(String str) => AboutUs.fromJson(json.decode(str));

String aboutUsToJson(AboutUs data) => json.encode(data.toJson());

class AboutUs {
  AboutUs({
    required this.ok,
    required this.message,
  });

  bool ok;
  Message message;

  factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
        ok: json["ok"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message.toJson(),
      };
}

class Message {
  Message({
    required this.id,
    required this.name,
    required this.phone,
    required this.message,
  });

  int id;
  String name;
  String phone;
  String message;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "message": message,
      };
}
