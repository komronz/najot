

import 'package:dio/dio.dart';
import 'package:najot/data/model/news_model.dart';
import 'package:najot/data/services/root_service.dart';

import '../utils/app_logger_util.dart';

class ProjectDataService{



  Future<NewsModel?> getNewsById(int id) async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/ru/news/?project__id=${id}",
      );
        print(response.statusCode);
      if (response.statusCode == 200) {
        final NewsModel responseModel =
        NewsModel.fromJson(
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