


import 'package:dio/dio.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/root_service.dart';

import '../bloc/language_cubit/language_cubit.dart';
import '../utils/app_logger_util.dart';
import 'hive_service.dart';

class VolunteerProjectService{

  Future<RootProjectModel?> getVolunteerModel() async {

    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/project/?type=VL&page_size=15",
          token: HiveService.to.getToken()
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
  Future<RootProjectModel?> getProjectsByName(String name) async {

    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/${LanguageCubit.getLang()}/project/?type=VL&search=${name}",
          token: HiveService.to.getToken()
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