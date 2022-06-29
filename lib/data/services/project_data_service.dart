import 'dart:io';

import 'package:dio/dio.dart';
import 'package:najot/data/model/comments_model.dart';
import 'package:najot/data/model/news_model.dart';
import 'package:najot/data/model/question_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../utils/app_logger_util.dart';

class ProjectDataService {
  HttpService _httpService = RootService.httpService;

  Future<NewsModel?> getNewsById(int id) async {
    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/uz/news/?project__id=${id}",
          token: HiveService.to.getToken());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final NewsModel responseModel = NewsModel.fromJson(
          response.data,
        );
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> postNewsBYId(
    int id,
    String title,
    String comment,
    File image,
  ) async {
    try {
      final path = 'https://api.najot.uz/uz/project/${id}/comment/create/';
      FormData formData = FormData.fromMap({
        "project": id,
        "title": title,
        "content" : comment,
        "cover": await MultipartFile.fromFile(image.path,filename: "image",),
        "type" : "image/jpg"


      });
      final headers = {HttpHeaders.contentTypeHeader: "multipart/from-data"};
      var response = await _httpService.postFile(
          path: path,
          formData: formData,
          headers: headers,
          token: HiveService.to.getToken());
      if (response != null) {
        print(response.statusCode);
        if (response.statusCode == 201) {
          return true;
        }
      } else {
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
    return null;
  }

  Future<QuestionModel?> getQuestionsById(int id) async {
    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/uz/question/?project__id=${id}",
          token: HiveService.to.getToken());
      if (response.statusCode == 200) {
        final QuestionModel responseModel = QuestionModel.fromJson(
          response.data,
        );
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<CommentsModel?> getCommentsById(int id) async {
    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/uz/project/${id}/comment/list/",
          token: HiveService.to.getToken());
      if (response.statusCode == 200) {
        final CommentsModel responseModel = CommentsModel.fromJson(
          response.data,
        );
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> postCommentsBYId(int id, String content) async {
    try {
      final path = 'https://api.najot.uz/uz/project/${id}/comment/create/';
      final body = {"content": content};
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
          path: path,
          fields: body,
          headers: headers,
          token: HiveService.to.getToken());
      if (response != null) {
        print(response.statusCode);
        if (response.statusCode == 201) {
          return true;
        }
      } else {
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
    return null;
  }

  Future<bool?> postQuestionBYId(int id, String title, String content) async {
    try {
      final path = 'https://api.najot.uz/uz/question/';
      final body = {"title": title, "content": content, "project": id};
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
          path: path,
          fields: body,
          headers: headers,
          token: HiveService.to.getToken());
      if (response != null) {
        print(response.statusCode);
        if (response.statusCode == 201) {
          return true;
        }
      } else {
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
    return null;
  }
}
