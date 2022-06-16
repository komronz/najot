class FavoriteAddModel {
  Links? links;
  int? currentPageNumber;
  int? totalPages;
  int? count;
  List<FavouriteModel>? results;

  FavoriteAddModel(
      {this.links,
        this.currentPageNumber,
        this.totalPages,
        this.count,
        this.results});

  FavoriteAddModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    currentPageNumber = json['current_page_number'];
    totalPages = json['total_pages'];
    count = json['count'];
    if (json['results'] != null) {
      results = <FavouriteModel>[];
      json['results'].forEach((v) {
        results!.add(new FavouriteModel.fromJson(v));
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
  Null? next;
  Null? previous;

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

class FavouriteModel {
  int? id;
  Project? project;

  FavouriteModel({this.id, this.project});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    return data;
  }
}

class Project {
  int? id;
  String? title;
  String? cover;

  Project({this.id, this.title, this.cover});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['cover'] = this.cover;
    return data;
  }
}
