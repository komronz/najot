import 'dart:io';

import 'package:dio/dio.dart';
import 'package:najot/data/model/news_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../utils/app_logger_util.dart';

class VolunteerProfileService {
  HttpService _httpService = RootService.httpService;

  Future<NewsModel?> getNewsById(int id) async {
    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/ru/news/?project__id=${id}",
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

  Future<bool?> postVolunteerData(
      String  name,
      String surname,
      String address,
      String gender,
      String birthday,
      String passportSeries,
      String passPortNumber,
      String givenByWhom,
      String givenData,
      File passportFront,
      File passportBack,
      ) async {
    try {
      final path = 'https://api.najot.uz/ru/volunteer-profile/';
      String file1 = passportFront.path.split('/').last;
      String file2 = passportBack.path.split('/').last;
      FormData formData = FormData.fromMap({
        "address": address,
        "birthdate ": birthday,
        "passport_series ": passportSeries,
        "passport_number  ": passPortNumber,
        "given_by_whom   ": givenByWhom,
        "given_date    ": givenData,
        "passport_front ": await MultipartFile.fromFile(passportFront.path, filename: file1),
        "passport_back  ": await MultipartFile.fromFile(passportBack.path, filename: file2),
      });

      final headers = {HttpHeaders.contentTypeHeader: "multipart/from-data"};
      var response = await _httpService.postFile(
          path: path,
          formData: formData,
          headers: headers,
          token: HiveService.to.getToken());
      if (response != null) {
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


}
