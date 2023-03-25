import 'package:equatable/equatable.dart';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class MainAboutModel extends Equatable {
  List<AboutModel>? aboutModel;

  MainAboutModel({
    this.aboutModel,
  });

  static MainAboutModel mainAboutModel = MainAboutModel(
    aboutModel: const [],
  );

  MainAboutModel.fromJson(List<dynamic>? jsonList) {
    if (jsonList != null) {
      aboutModel = <AboutModel>[];
      jsonList.forEach((v) {
        aboutModel!.add(new AboutModel.fromJson(v));
      });
    }
  }

  @override
  List<Object?> get props => [AboutModel];
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainAboutModel &&
          runtimeType == other.runtimeType &&
          AboutModel == other.aboutModel;
}

class AboutModel extends Equatable {
  int? id;
  String? name;
  String? phone1;
  String? phone2;
  String? cover;
  String? content;
  String? address;

  AboutModel({
    this.id,
    this.name,
    this.phone1,
    this.phone2,
    this.cover,
    this.content,
    this.address,
  });

  AboutModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    phone1 = json['phone1']?.toString();
    phone2 = json['phone2']?.toString();
    content = json['content']?.toString();
    cover = json['cover']?.toString();
    address = json['address']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['content'] = content;
    data['cover'] = cover;
    data['address'] = address;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone1,
        phone2,
        content,
        cover,
        address,
      ];
}