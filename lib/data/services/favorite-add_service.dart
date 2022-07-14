
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/favorites-add_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../bloc/language_cubit/language_cubit.dart';
import '../utils/app_logger_util.dart';
import 'http_service.dart';

class FavoriteAddService {
  final HttpService httpService= RootService.httpService;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<FavoriteAddService>(FavoriteAddService());
  }
  Future<FavoriteAddModel?> getModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/users/me/favourites/",
        token: HiveService.to.getToken(),
      );
      if (response.statusCode == 200) {
        final FavoriteAddModel responseModel = FavoriteAddModel.fromJson(response.data);
        return responseModel;
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