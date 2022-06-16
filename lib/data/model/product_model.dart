import 'package:najot/data/model/news_model.dart';

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
  Author? author;
  String? authorImage;
  String? productImage;
  Category2? category;
  Category2? project;
  String? title;
  String? description;
  String? price;
  String? deliveryTime;

  Products(
      {this.id,
        this.author,
        this.authorImage,
        this.productImage,
        this.category,
        this.project,
        this.title,
        this.description,
        this.price,
        this.deliveryTime});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    authorImage = json['author_image'];
    productImage = json['product_image'];
    category = json['category'] != null
        ? new Category2.fromJson(json['category'])
        : null;
    project =
    json['project'] != null ? new Category2.fromJson(json['project']) : null;
    title = json['title'];
    description = json['description'];
    price = json['price'];
    deliveryTime = json['delivery_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['author_image'] = this.authorImage;
    data['product_image'] = this.productImage;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['delivery_time'] = this.deliveryTime;
    return data;
  }
}

class Category2 {
  int? id;
  String? title;

  Category2({this.id, this.title});

  Category2.fromJson(Map<String, dynamic> json) {
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