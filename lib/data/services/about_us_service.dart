import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/about_us_model.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import '../bloc/language_cubit/language_cubit.dart';
import '../model/about_model.dart';
import 'hive_service.dart';
class AboutUsService{
  final HttpService _httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<AboutUsService>(AboutUsService());
  }

  Future<MainAboutModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/about/",
      );
      if (response.statusCode == 200) {
        final MainAboutModel responseModel = MainAboutModel.fromJson(response.data['results']);
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
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
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      Response? response = await _httpService.post(
        path: _path,
        token: HiveService.to.getToken()!.access,
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