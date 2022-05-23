import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/projects_model.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

class ProjectsModelService{
  final HttpService httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<ProjectsModelService>(ProjectsModelService());
  }
  Future<ProjectsModel?> getProductModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://najot.uz/en/project/",
      );
      if (response.statusCode == 200) {
        final ProjectsModel responseModel =
        ProjectsModel.fromJson(
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