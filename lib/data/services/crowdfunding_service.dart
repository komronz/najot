import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/categories_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../bloc/language_cubit/language_cubit.dart';
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
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/project/?type=CF",
        token: HiveService.to.getToken()!.access
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
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/categories/?type=CF",
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
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/project/?type=CF&category=${id}&page_size=15",
          token: HiveService.to.getToken()!.access
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

  Future<RootProjectModel?> getProjectsByName(String name) async {

    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/${LanguageCubit.getLang()}/project/?type=CF&search=${name}",
          token:HiveService.to.getToken()!.access
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