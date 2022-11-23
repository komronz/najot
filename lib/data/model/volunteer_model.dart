import 'package:equatable/equatable.dart';
import 'package:najot/data/model/project_model.dart';
class RootProjectModel extends Equatable {
  Links? links;
  int? currentPageNumber;
  int? totalPages;
  int? count;
  List<ProjectModel>? results;

  RootProjectModel({
    this.links,
    this.currentPageNumber,
    this.totalPages,
    this.count,
    this.results,
  });
  RootProjectModel.fromJson(Map<String, dynamic> json) {
    links = (json['links'] != null) ? Links.fromJson(json['links']) : null;
    currentPageNumber = json['current_page_number']?.toInt();
    totalPages = json['total_pages']?.toInt();
    count = json['count']?.toInt();
    if (json['results'] != null) {
      results = <ProjectModel>[];
      json['results'].forEach((v) {
        results!.add(new ProjectModel.fromJson(v));

      });
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['current_page_number'] = currentPageNumber;
    data['total_pages'] = totalPages;
    data['count'] = count;
    if (results != null) {
      final v = results;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v.toJson());
      });
      data['results'] = arr0;
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [results,links];
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



