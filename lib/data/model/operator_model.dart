///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class OperatorModelResultsUser {

  int? id;
  String? firstName;
  String? lastName;
  String? photo;

  OperatorModelResultsUser({
    this.id,
    this.firstName,
    this.lastName,
    this.photo,
  });
  OperatorModelResultsUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    photo = json['photo']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['photo'] = photo;
    return data;
  }
}

class OperatorModelResults {


  int? id;
  String? file;
  String? content;
  String? createdAt;
  OperatorModelResultsUser? user;
  bool? isClient;

  OperatorModelResults({
    this.id,
    this.file,
    this.content,
    this.user,
    this.isClient,
    this.createdAt,
  });
  OperatorModelResults.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    file = json['file']?.toString();
    content = json['content']?.toString();
    user = (json['user'] != null) ? OperatorModelResultsUser.fromJson(json['user']) : null;
    isClient = json['is_client'];
    createdAt = json['created_at']?.toString();

  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['file'] = file;
    data['content'] = content;
    data['created_at'] = createdAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['is_client'] = isClient;
    return data;
  }
}

class OperatorModelLinks {

  String? next;
  String? previous;

  OperatorModelLinks({
    this.next,
    this.previous,
  });
  OperatorModelLinks.fromJson(Map<String, dynamic> json) {
    next = json['next']?.toString();
    previous = json['previous']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['next'] = next;
    data['previous'] = previous;
    return data;
  }
}

class OperatorModel {

  OperatorModelLinks? links;
  int? currentPageNumber;
  int? totalPages;
  int? count;
  List<OperatorModelResults?>? results;

  OperatorModel({
    this.links,
    this.currentPageNumber,
    this.totalPages,
    this.count,
    this.results,
  });
  OperatorModel.fromJson(Map<String, dynamic> json) {
    links = (json['links'] != null) ? OperatorModelLinks.fromJson(json['links']) : null;
    currentPageNumber = json['current_page_number']?.toInt();
    totalPages = json['total_pages']?.toInt();
    count = json['count']?.toInt();
    if (json['results'] != null) {
      final v = json['results'];
      final arr0 = <OperatorModelResults>[];
      v.forEach((v) {
        arr0.add(OperatorModelResults.fromJson(v));
      });
      results = arr0;
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
        arr0.add(v!.toJson());
      });
      data['results'] = arr0;
    }
    return data;
  }
}
