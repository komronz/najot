
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/about_model.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../utils/app_logger_util.dart';

class AboutService{
  final HttpService httpService = HttpService();


  static Future init() async{
    final getIt = GetIt.instance;
    getIt.registerSingleton<AboutService>(AboutService());
  }


  Future<MainAboutModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/en/about/",
      );
      if (response.statusCode == 200) {
        final MainAboutModel responseModel = MainAboutModel.fromJson(response.data['results']);
        // List<FaqModel> list=[];
        // response.data.forEach((v) {
        //   list.add(new FaqModel.fromJson(v));
        // });
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