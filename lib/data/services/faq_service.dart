import 'package:dio/dio.dart';
import 'package:najot/data/model/faq_model.dart';
import 'package:najot/data/services/root_service.dart';

import '../utils/app_logger_util.dart';

class FaqService {
  Future<MainFaqModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/faq/",
      );
      if (response.statusCode == 200) {
        final MainFaqModel responseModel = MainFaqModel.fromJson(response.data);
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
