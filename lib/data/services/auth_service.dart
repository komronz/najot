import 'dart:io';

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
      print(formatNumber(phone));
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
  }

  Future<ConfirmNumberModel?> confirmPhoneNumber(
    String phone,

  ) async {
    try {
      final path = 'https://najot.uz/ru/auth/check_phone';
      final body = {
        "phone": formatNumber(phone),
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
        path: path,
        fields: body,
        headers: headers,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final ConfirmNumberModel confirmNumberModel=
          ConfirmNumberModel.fromJson(response.data);
          AppLoggerUtil.i(TokenModel.fromJson(response.data).token.toString());
          return confirmNumberModel;
        } else if (response.statusCode! > 200) {
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

  String formatNumber(String number) {
    var text = number.replaceAll(RegExp(r'\D()'), '');
    return "998${text}";
  }
}
