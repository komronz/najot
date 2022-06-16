import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/oreder_model.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import 'http_service.dart';

class OrderService{
  final HttpService httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<OrderService>(OrderService());
  }
  Future<OrderModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/ru/product/",
          token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU1NzA2MjQ2LCJpYXQiOjE2NTUxMDE0NDYsImp0aSI6IjJkMGZhMmVhNTAyMzQ2NDJiODM0YjdiN2E0NmE3OTM1IiwidXNlcl9pZCI6NH0.dnnXkBJMgusAePSK7jAOpTf-i9YurF8PIqBErrmtEbc"
      );
      if (response.statusCode == 200) {
        final OrderModel responseModel =
        OrderModel.fromJson(
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



}