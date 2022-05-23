import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import '../model/organization_model.dart';

class OrganizationService{
  final HttpService httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<OrganizationService>(OrganizationService());
  }

  Future<OrganizationModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/organization/",
      );
      if (response.statusCode == 200) {
        final OrganizationModel responseModel =
        OrganizationModel.fromJson(
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