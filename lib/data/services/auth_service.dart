import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/services/root_service.dart';

import '../model/token_model.dart';
import '../utils/app_logger_util.dart';
import 'http_service.dart';

class AuthService {
  final HttpService _httpService = RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<AuthService>(AuthService());
  }

  Future<TokenModel?> userLogin(String phone, String password) async {
    try {
      final path = 'http://api.najot.thinkland.uz/auth/login-end';
      final body = {
        "phone": formatNumber(phone),
        "code": password,
      };
      AppLoggerUtil.d(formatNumber(phone));
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
        path: path,
        fields: body,
        headers: headers,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          AppLoggerUtil.i(TokenModel.fromJson(response.data).token.toString());
          return TokenModel.fromJson(response.data);
        }
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
    return null;
  }

  Future<bool> confirmPhoneNumber(
    String phone,
  ) async {
    try {
      final path = 'http://api.najot.thinkland.uz/auth/login-start';
      final body = {
        "phone": formatNumber(phone),
        "first_name": "Ozodbek",
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      Response? response = await _httpService.post(
        path: path,
        fields: body,
        headers: headers,
      );
      AppLoggerUtil.i(response?.statusCode?.toString() ?? "");
      if (response != null) {
        if (response.statusCode == 200) {
          AppLoggerUtil.i(TokenModel.fromJson(response.data).token.toString());
          return true;
        } else if (response.statusCode! > 200) {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
      return false;
    }
    return false;
  }

  String formatNumber(String number) {
    var text = number.replaceAll(RegExp(r'\D()'), '');
    return "998${text}";
  }
}
