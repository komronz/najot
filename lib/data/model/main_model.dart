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
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['crowdfunding'] != null) {
      crowdfunding = <ProjectModel>[];
      json['crowdfunding'].forEach((v) {
        crowdfunding!.add(new ProjectModel.fromJson(v));
      });
    }
    if (json['volunteering'] != null) {
      volunteering = <ProjectModel>[];
      json['volunteering'].forEach((v) {
        volunteering!.add(new ProjectModel.fromJson(v));
      });
    }
    if (json['charity'] != null) {
      charity = <ProjectModel>[];
      json['charity'].forEach((v) {
        charity!.add(new ProjectModel.fromJson(v));
      });
    }
    if (json['slider'] != null) {
      slider = <SliderList>[];
      json['slider'].forEach((v) {
        slider!.add(new SliderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.crowdfunding != null) {
      data['crowdfunding'] = this.crowdfunding!.map((v) => v.toJson()).toList();
    }
    if (this.volunteering != null) {
      data['volunteering'] = this.volunteering!.map((v) => v.toJson()).toList();
    }
    if (this.charity != null) {
      data['charity'] = this.charity!.map((v) => v.toJson()).toList();
    }
    if (this.slider != null) {
      data['slider'] = this.slider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;
  Null? parent;

  Categories({this.id, this.name, this.slug, this.parent});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['parent'] = this.parent;
    return data;
  }
}

class SliderList {
  int? id;
  String? title;
  String? image;
  String? description;

  SliderList({this.id, this.title, this.image, this.description});

  SliderList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}
