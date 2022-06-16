
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/favorites-add_model.dart';
import 'package:najot/data/services/root_service.dart';

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
        url: "https://api.najot.uz/en/users/me/favourites/",
        token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU1OTczMDcxLCJpYXQiOjE2NTUzNjgyNzEsImp0aSI6IjU1Nzg0ODdkYTY5ZjRkZWRhZTI1MDU1YzAwNTk2Njc3IiwidXNlcl9pZCI6NH0.lRw0M_h56p9oHmzG3Dx8DEweE-9mgqg9UwmdP2YKuxE"
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