class ProjectCategories {
  Links? links;
  int? currentPageNumber;
  int? totalPages;
  int? count;
  List<ProjectCategory>? results;

  ProjectCategories(
      {this.links,
        this.currentPageNumber,
        this.totalPages,
        this.count,
        this.results});

  ProjectCategories.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    currentPageNumber = json['current_page_number'];
    totalPages = json['total_pages'];
    count = json['count'];
    if (json['results'] != null) {
      results = <ProjectCategory>[];
      json['results'].forEach((v) {
        results!.add(new ProjectCategory.fromJson(v));
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

class ProjectCategory {
  int? id;
  String? name;
  String? slug;
  String? type;
  int? parent;
  List<TabCategories>? children;

  ProjectCategory(
      {this.id, this.name, this.slug, this.type, this.parent, this.children});

  ProjectCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    parent = json['parent'];
    if (json['children'] != null) {
      children = <TabCategories>[];
      json['children'].forEach((v) {
        children!.add(new TabCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['type'] = this.type;
    data['parent'] = this.parent;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TabCategories {
  int? id;
  String? name;
  String? slug;

  TabCategories({this.id, this.name, this.slug,});

  TabCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;

    return data;
  }
}
