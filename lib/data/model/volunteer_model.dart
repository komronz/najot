

import 'package:najot/data/model/project_model.dart';


class RootProjectModel {
  Links? links;
  int? currentPageNumber;
  int? totalPages;
  int? count;
  List<ProjectModel>? projectModel;

  RootProjectModel(
      {this.links,
        this.currentPageNumber,
        this.totalPages,
        this.count,
        this.projectModel,
      });

  RootProjectModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    currentPageNumber = json['current_page_number'];
    totalPages = json['total_pages'];
    count = json['count'];
    if (json['results'] != null) {
      projectModel = <ProjectModel>[];
      json['results'].forEach((v) {
        projectModel!.add(new ProjectModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['current_page_number'] = this.currentPageNumber;
    data['total_pages'] = this.totalPages;
    data['count'] = this.count;
    if (this.projectModel != null) {
      data['results'] = this.projectModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? next;
  String? previous;

  Links({this.next, this.previous});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next']?.toString();
    previous = json['previous']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    data['previous'] = this.previous;
    return data;
  }
}



