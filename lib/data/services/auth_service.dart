import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:najot/data/model/auth_model/login_end_model.dart';
import 'package:najot/data/services/root_service.dart';

import '../model/auth_model/token_model.dart';
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
    return null;
  }

  Future<ConfirmNumberModel?> confirmPhoneNumber(
    String phone,

  ) async {
    try {
      final path = 'https://api.najot.uz/ru/auth/check-phone/';
      final body = {
        "phone": formatNumber(phone),
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
        path: path,
        fields: body,
        headers: headers,
      );
      print(response!.statusCode);
      print(phone);
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

  Future<TokenModel?> registration(
      String phone,
      String firstName,
      String lastName

      ) async {
    try {
      final path = 'https://api.najot.uz/ru/auth/login-start/';
      final body = {
        "phone": formatNumber(phone),
        "first_name": firstName,
        "last_name": lastName
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
        path: path,
        fields: body,
        headers: headers,
      );
      print(response!.statusCode);
      if (response != null) {
        if (response.statusCode == 200) {
          final TokenModel tokenModel=
          TokenModel.fromJson(response.data);
          AppLoggerUtil.i(TokenModel.fromJson(response.data).token.toString());
          return tokenModel;
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


  Future<LoginEndModel?> loginEnd(
      int code,
      String codeToken,

      ) async {
    try {
      final path = 'https://api.najot.uz/ru/auth/login-end/';
      final body = {
        "code": code,
        "code_token": codeToken
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
        path: path,
        fields: body,
        headers: headers,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final LoginEndModel loginEndModel=
          LoginEndModel.fromJson(response.data);
          return loginEndModel;
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
