import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/auth_model/user.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';
class UserUpdateService {
  final HttpService _httpService = RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<UserUpdateService>(UserUpdateService());
  }

  Future<bool?> postModel(
    String phone,
    String firstName,
    String lastName,
    String gender,
    File photo,
    String status,
    bool isVolunteer,
  ) async {
    try {
      final _path = "https://api.najot.uz/ru/users/me/";
      String file1 = photo.path.split('/').last;
      FormData formData = FormData.fromMap({
        "phone": phone,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "photo": await MultipartFile.fromFile(photo.path, filename: file1),
        "status": status,
        "is_volunteer": isVolunteer,
      });
      final headers = {HttpHeaders.contentTypeHeader: "multipart/from-data"};
      var response = await _httpService.postFile(
        path: _path,
        formData: formData,
        headers: headers,
        token: HiveService.to.getToken(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          return true;
        }else{
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
  }

  Future<User?> getUserModel() async {
    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/ru/users/me/",
          token: HiveService.to.getToken()
      );

      if (response.statusCode == 200) {
        final User userModel =
        User.fromJson(
          response.data,);

        return userModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}
