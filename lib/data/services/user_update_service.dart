import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/add_project.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import '../model/auth_model/login_end_model.dart';

class UserUpdateService{
  final HttpService _httpService = RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<UserUpdateService>(UserUpdateService());
  }

  Future<UserModel?> postModel(
      String phone,
      String firstName,
      String lastName,
      String gender,
      String photo,
      String status,
      bool isVolunteer,
      ) async {
    try {
      final _path = "https://api.najot.uz/ru/users/me/";
      final body = {
        "phone": phone,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "photo": photo,
        "status": status,
        "is_volunteer": isVolunteer,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      Response? response = await _httpService.post(
        path: _path,
        fields: body,
        token: HiveService.to.getToken(),
        headers: headers,
      );

      if (response != null) {
        if (response.statusCode == 201) {
          AppLoggerUtil.i(UserModel.fromJson(response.data).toString());
          return UserModel.fromJson(response.data);
        } else if (response.statusCode == 401) {
          return null;
        } else if (response.statusCode! >= 500) {
          return null;
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