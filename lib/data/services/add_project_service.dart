import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/add_project.dart';

import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import '../bloc/language_cubit/language_cubit.dart';
import 'hive_service.dart';

class AddProjectService {
  final HttpService _httpService = RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<AddProjectService>(AddProjectService());
  }

  Future<AddProjectModel?> postModel(
    String whoAdd,
    String name,
    String type,
    String description,
  ) async {
    try {
      final _path = "https://api.najot.uz/${LanguageCubit.getLang()}/add-project/";
      final body = {
        "who_add": whoAdd,
        "name": name,
        "type": type,
        "description": description
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      Response? response = await _httpService.post(
        path: _path,
        fields: body,
        token: HiveService.to.getToken()!.access,
        headers: headers,
      );

      if (response != null) {
        if (response.statusCode == 201) {
          AppLoggerUtil.i(AddProjectModel.fromJson(response.data).toString());
          return AddProjectModel.fromJson(response.data);
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


