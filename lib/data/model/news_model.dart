import 'package:najot/data/model/auth_model/user.dart';

class NewsModel {
  Links? links;
  int? currentPageNumber;
  int? totalPages;
  int? count;
  List<NewsData>? results;

  NewsModel(
      {this.links,
        this.currentPageNumber,
        this.totalPages,
        this.count,
        this.results});

  NewsModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    currentPageNumber = json['current_page_number'];
    totalPages = json['total_pages'];
    count = json['count'];
    if (json['results'] != null) {
      results = <NewsData>[];
      json['results'].forEach((v) {
        results!.add(new NewsData.fromJson(v));
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
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? next;
  String? previous;

  Links({this.next, this.previous});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    data['previous'] = this.previous;
    return data;
  }
}

class NewsData {
  int? id;
  Project? project;
  String? title;
  String? content;
  String? cover;
  String? createdAt;
  User? user;

  NewsData(
      {this.id,
        this.project,
        this.title,
        this.content,
        this.cover,
        this.createdAt,
        this.user});

  NewsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    title = json['title'];
    content = json['content'];
    cover = json['cover'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['title'] = this.title;
    data['content'] = this.content;
    data['cover'] = this.cover;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Project {
  int? id;
  String? title;

  Project({this.id, this.title});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

