import 'categories_model.dart';

class ProductModel {
  Links? links;
  int? currentPageNumber;
  int? totalPages;
  int? count;
  List<Products>? results;

  ProductModel(
      {this.links,
        this.currentPageNumber,
        this.totalPages,
        this.count,
        this.results});

  ProductModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    currentPageNumber = json['current_page_number'];
    totalPages = json['total_pages'];
    count = json['count'];
    if (json['results'] != null) {
      results = <Products>[];
      json['results'].forEach((v) {
        results!.add(new Products.fromJson(v));
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



class Products {
  int? id;
  int? author;
  String? authorName;
  int? category;
  int? project;
  String? title;
  String? description;
  String? price;
  String? createdAt;
  String? modifiedAt;

  Products(
      {this.id,
        this.author,
        this.authorName,
        this.category,
        this.project,
        this.title,
        this.description,
        this.price,
        this.createdAt,
        this.modifiedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    authorName = json['author_name'];
    category = json['category'];
    project = json['project'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['author'] = this.author;
    data['author_name'] = this.authorName;
    data['category'] = this.category;
    data['project'] = this.project;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    return data;
  }
}
