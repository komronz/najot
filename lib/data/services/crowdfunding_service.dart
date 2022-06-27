import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/categories_model.dart';
import 'package:najot/data/services/root_service.dart';

import '../model/volunteer_model.dart';
import '../utils/app_logger_util.dart';

class CrowdfundingService{

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<CrowdfundingService>(CrowdfundingService());
    await CrowdfundingService().getCategoriesModel();
  }
  static int length=0;

  Future<RootProjectModel?> getCrowdfundingModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/ru/project/?type=CF",
      );
      if (response.statusCode == 200) {
        final RootProjectModel responseModel =
        RootProjectModel.fromJson(
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

  Future<ProjectCategories?> getCategoriesModel() async {

    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/ru/categories/?type=CF",
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final ProjectCategories responseModel =
        ProjectCategories.fromJson(
          response.data,
        );
        length= responseModel.results![0].children!.length;
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RootProjectModel?> getProjectsById(int id) async {

    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/ru/project/?type=CF&category=${id}&page_size=15",
      );

      if (response.statusCode == 200) {
        final RootProjectModel responseModel =
        RootProjectModel.fromJson(
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