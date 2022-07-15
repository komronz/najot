import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/about_us_model.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import '../bloc/language_cubit/language_cubit.dart';
class AboutUsService{
  final HttpService _httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<AboutUsService>(AboutUsService());
  }

  Future<AboutUs?> postModel(
      String name,
      String phoneNumber,
      String content) async {
    try {
      final _path = "https://api.najot.uz/${LanguageCubit.getLang()}/contact/";
      final body = {
        "name": name,
        "phone": formatNumber(phoneNumber),
        "content": content
      };

      print(formatNumber(phoneNumber));
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      Response? response = await _httpService.post(
        path: _path,
        token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU2MDUyNDEwLCJpYXQiOjE2NTU0NDc2MTAsImp0aSI6ImM2YmY1N2MxNzE1NjQ0NmNhODRiOWZjOWMzZjFkMTU2IiwidXNlcl9pZCI6NH0.Ku-m6ZnlD9nc7zQ1mWGgkb5iWy3bJN1_Kt-bG6lpYJE",
        fields: body,
        headers: headers,
      );
      if (response != null) {
        if (response.statusCode==201){
          AppLoggerUtil.i(AboutUs.fromJson(response.data).toString());
          return AboutUs.fromJson(response.data);
        }else if(response.statusCode == 401){
          return null;
        }else if(response.statusCode! >= 500) {
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

  String formatNumber(String? number) {
    var text = number!.replaceAll(RegExp(r'\D()'), '');
    return "+${text}";
  }
}