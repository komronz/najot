import 'package:floor/floor.dart';
@entity
class VolunteerDbModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? type;
  String? title;
  String? helpType;
  String? deadLine;
  String? content;
  String? address;
  String? createdAt;
  String? modifiedAt;
  bool isDone=false;

  VolunteerDbModel({
    this.id,
    this.type,
    this.title,
    this.helpType,
    this.deadLine,
    this.content,
    this.address,
    this.createdAt,
    this.modifiedAt,
    this.isDone=false,
  });

  VolunteerDbModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    type = json['type'].toString();
    title = json['title'].toString();
    helpType = json['help_type']?.toString();
    deadLine = json['dead_line']?.toString();
    content = json['content']?.toString();
    address = json['address']?.toString();
    createdAt = json['created_at']?.toString();
    modifiedAt = json['modified_at']?.toString();
    isDone = false;

  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['help_type'] = helpType;
    data['dead_line'] = deadLine;
    data['content'] = content;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['modified_at'] = modifiedAt;
    data['is_done'] = isDone;
    return data;
  }
}