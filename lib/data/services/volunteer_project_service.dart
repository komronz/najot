


import 'package:dio/dio.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/root_service.dart';

import '../utils/app_logger_util.dart';

class VolunteerProjectService{

  Future<RootProjectModel?> getVolunteerModel() async {

    try {
      final Response response = await RootService.httpService.get(

        url: "https://najot.uz/ru/project/?type=VL",
        token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU1NzE2NDAzLCJpYXQiOjE2NTUxMTE2MDMsImp0aSI6ImE1MjFjN2FjZGFhZTRkZTY4OGUxMDQ2YmNhNzMwNmZiIiwidXNlcl9pZCI6NH0.4_9ZQtR8e761v-QGlGZxXiIq61o-79hAKfNdNlDm_N4"
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
}