import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/faq_model.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../bloc/language_cubit/language_cubit.dart';
import '../utils/app_logger_util.dart';

class FaqService {
  final HttpService httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<FaqService>(FaqService());
  }
  Future<MainFaqModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/faq/",
      );
      if (response.statusCode == 200) {
        final MainFaqModel responseModel = MainFaqModel.fromJson(response.data['results']);
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
