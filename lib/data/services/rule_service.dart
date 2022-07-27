import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/model/rule_page_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../bloc/language_cubit/language_cubit.dart';
import '../utils/app_logger_util.dart';
import 'http_service.dart';

class RuleService{
  final HttpService httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<RuleService>(RuleService());
  }


  Future<MainRuleModel?> getRulePageModel() async {
    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/${LanguageCubit.getLang()}/rule/",
        token: HiveService.to.getToken()!.access,

      );
      if (response.statusCode == 200) {

        final MainRuleModel responseModel =
        MainRuleModel.fromJson(
          response.data,);
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("-----------------");
      return null;
    }
  }
}