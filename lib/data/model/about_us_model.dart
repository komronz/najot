import 'dart:convert';

AboutUs newsFromJson(String str) => AboutUs.fromJson(json.decode(str));

String newsToJson(AboutUs data) => json.encode(data.toJson());

class AboutUs {
  AboutUs({
    required this.message,
  });

  Message message;

  factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
    message: Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
  };
}

class Message {
  Message({
    required this.title,
    required this.description,
    required this.content,
  });

  String title;
  String description;
  String content;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    title: json["title"],
    description: json["description"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "content": content,
  };
}
