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
      File? file,
      String content,
      ) async {
    try {
      final _path = "https://api.najot.uz/ru/operator-chat/";
      FormData formData;
      if(file!=null){
        String file1 = file.path.split('/').last;
         formData = FormData.fromMap({
          "content": content,
          "file": await MultipartFile.fromFile(file.path, filename: file1),
        });
      }else{
        formData = FormData.fromMap({
          "content": content,
        });
      }

      final headers = {HttpHeaders.contentTypeHeader: "multipart/from-data"};
      var response = await httpService.postFile(
        path: _path,
        formData: formData,
        headers: headers,
        token: HiveService.to.getToken(),
      );
      if (response != null) {
        if (response.statusCode == 201) {
          // AppLoggerUtil.i(OperatorModelResults.fromJson(response.data).toString());
          return true;
            // OperatorModelResults.fromJson(response.data);
        } else{
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



}