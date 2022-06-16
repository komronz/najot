import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/categories_model.dart';
import 'package:najot/data/services/root_service.dart';

import '../model/volunteer_model.dart';
import '../utils/app_logger_util.dart';

class CharityService{

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<CharityService>(CharityService());
    await CharityService().getCategoriesModel();
  }
  static int length=0;

  Future<RootProjectModel?> getCharityModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://najot.uz/ru/project/?type=CH",
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
        url: "https://najot.uz/en/categories/?type=CH",
      );

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
        url: "https://najot.uz/en/project/?type=CH&category=${id}&page_size=15",
      );

      if (response.statusCode == 200) {
        final RootProjectModel responseModel =
        RootProjectModel.fromJson(
          response.data,
        );
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        print(" ddddddddddddddddddddd");
        return null;
      }
    } catch (e) {
      print(" ddddddddddddddddddddd");
      return null;
    }
  }


}