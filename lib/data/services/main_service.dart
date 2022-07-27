import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:najot/data/model/auth_model/login_end_model.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import '../bloc/language_cubit/language_cubit.dart';
import '../model/auth_model/user.dart';
import '../utils/app_logger_util.dart';
import 'http_service.dart';

class MainService {
  HttpService _httpService = RootService.httpService;

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
  Future<LoginEndModel?> tokenUpdate() async {
    try {
      final path =
          'https://api.najot.uz/ru/auth/api/token/refresh/';
      final body = {
        "refresh": HiveService.to.getToken()!.refresh,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
        path: path,
        fields: body,
        headers: headers,
        token: HiveService.to.getToken()!.access,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final LoginEndModel loginEndModel = LoginEndModel.fromJson(response.data);
          return loginEndModel;
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
          token: HiveService.to.getToken()!.access);

      if (response.statusCode == 200) {
        final User userModel = User.fromJson(
          response.data,
        );

        return userModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<MainModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/${LanguageCubit.getLang()}/home/",
          token: HiveService.to.getToken()!.access,
      );
      if (response.statusCode == 200) {
        final MainModel responseModel = MainModel.fromJson(
          response.data,
        );
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("-----------------");
      return null;
    }
  }

  Future<bool?> changeLike(int id) async {
    try {
      final path =
          'https://api.najot.uz/${LanguageCubit.getLang()}/project/${id}/favourite/';

      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
        path: path,
        headers: headers,
        token: HiveService.to.getToken()!.access,
      );
      if (response != null) {
        print(response.statusCode);
        if (response.statusCode == 201) {
          return true;
        } else if (response.statusCode == 200) {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
  }
}
