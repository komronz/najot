

import 'package:dio/dio.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/data/services/root_service.dart';

import '../utils/app_logger_util.dart';

class MainService{

  Future<MainModel?> getModel() async {


    try {
      final Response response = await RootService.httpService.get(
        url: "http://api.najot.thinkland.uz/api/home/",
      );

      if (response.statusCode == 200) {
        final MainModel responseModel =
        MainModel.fromJson(
          response.data,);
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
  }



}