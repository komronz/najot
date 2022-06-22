import 'package:najot/data/model/project_model.dart';

class MainModel {
  List<Categories>? categories;
  List<ProjectModel>? crowdfunding;
  List<ProjectModel>? volunteering;
  List<ProjectModel>? charity;
  List<SliderList>? slider;

  MainModel(
      {this.categories,
      this.crowdfunding,
      this.volunteering,
      this.charity,
      this.slider});

  static MainModel mainModel = MainModel(
    categories: const [],
    crowdfunding: const [],
    charity: const [],
    slider: const [],
    volunteering: const [],
  );

  MainModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['crowdfunding'] != null) {
      crowdfunding = <ProjectModel>[];
      json['crowdfunding'].forEach((v) {
        crowdfunding!.add(ProjectModel.fromJson(v));
      });
    }
    if (json['volunteering'] != null) {
      volunteering = <ProjectModel>[];
      json['volunteering'].forEach((v) {
        volunteering!.add(ProjectModel.fromJson(v));
      });
    }
    if (json['charity'] != null) {
      charity = <ProjectModel>[];
      json['charity'].forEach((v) {
        charity!.add(ProjectModel.fromJson(v));
      });
    }
    if (json['slider'] != null) {
      slider = <SliderList>[];
      json['slider'].forEach((v) {
        slider!.add(SliderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (crowdfunding != null) {
      data['crowdfunding'] = crowdfunding!.map((v) => v.toJson()).toList();
    }
    if (volunteering != null) {
      data['volunteering'] = volunteering!.map((v) => v.toJson()).toList();
    }
    if (charity != null) {
      data['charity'] = charity!.map((v) => v.toJson()).toList();
    }
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;
  Object? parent;

  Categories({this.id, this.name, this.slug, this.parent});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['parent'] = parent;
    return data;
  }
}

class SliderList {
  int? id;
  String? title;
  String? cover;
  String? description;

  SliderList({this.id, this.title, this.cover, this.description});

  SliderList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    cover = json['cover'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['cover'] = cover;
    data['description'] = description;
    return data;
  }
}
