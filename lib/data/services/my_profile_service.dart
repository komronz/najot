import 'dart:io';

import 'package:najot/data/bloc/language_cubit/language_cubit.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';
class MyProfileService{

  Future<bool?> postDeleteBYId(String reason) async {
    HttpService _httpService = RootService.httpService;
    try {
      final path = 'https://api.najot.uz/${LanguageCubit.getLang()}/users/delete-profile/';
      final body = {
        "reason": reason
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
          path: path,
          fields: body,
          headers: headers,
          token: HiveService.to.getToken());
      if (response != null) {
        if (response.statusCode == 201) {
          return true;
        }
      } else {
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
    return null;
  }


}