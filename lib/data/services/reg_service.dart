


import 'package:get_it/get_it.dart';
import 'package:najot/data/services/root_service.dart';

import 'http_service.dart';

class RegService{
  final HttpService _httpService = RootService.httpService;
  //
  // static Future init() async {
  //   final getIt = GetIt.instance;
  //   getIt.registerSingleton<RegService>(RegService());
  // }
  //
  // Future<bool> userLogin(String phone, String password) async {
  //   try {
  //     final path = 'api/token/';
  //     final body = {
  //       "phone": formatNumber(phone),
  //       "password": password,
  //     };
  //     final headers = {HttpHeaders.contentTypeHeader: "application/json"};
  //     var response = await _httpService.post(
  //       path: path,
  //       fields: body,
  //       headers: headers,
  //     );
  //     if (response != null) {
  //       if (response.statusCode == 200) {
  //         AppLoggerUtil.i(TokenModel.fromJson(response.data).access.toString());
  //         return TokenModel.fromJson(response.data);
  //       } else if (response.statusCode == 401) {
  //         return TokenModel(
  //           refresh: null,
  //           access: null,
  //         );
  //       } else if (response.statusCode! >= 500) {
  //         return null;
  //       }
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     AppLoggerUtil.e("$e");
  //     return null;
  //   }
  // }
}