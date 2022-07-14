import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/operator_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

class OperatorService{
  final HttpService httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<OperatorService>(OperatorService());
  }
  Future<OperatorModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/ru/operator-chat/",
        token: HiveService.to.getToken(),
      );
      if (response.statusCode == 200) {
        final OperatorModel responseModel =
        OperatorModel.fromJson(
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
  Future<bool?> postModel(
      String content,
      ) async {
    try {
      final _path = "https://api.najot.uz/ru/operator-chat/";
      final body = {
        "content": content,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await httpService.post(
        path: _path,
        fields: body,
        headers: headers,
        token: HiveService.to.getToken(),
      );

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