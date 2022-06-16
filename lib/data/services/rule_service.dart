import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/model/rule_page_model.dart';
import 'package:najot/data/services/root_service.dart';

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
          url: "https://api.najot.uz/ru/rule/",
          token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU1NzA2MjQ2LCJpYXQiOjE2NTUxMDE0NDYsImp0aSI6IjJkMGZhMmVhNTAyMzQ2NDJiODM0YjdiN2E0NmE3OTM1IiwidXNlcl9pZCI6NH0.dnnXkBJMgusAePSK7jAOpTf-i9YurF8PIqBErrmtEbc"

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