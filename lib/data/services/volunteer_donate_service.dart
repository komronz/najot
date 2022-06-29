import 'package:dio/dio.dart';
import 'package:najot/data/model/volunteer_donate_model.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

class VolunteerDonateService{
  Future<VolunteerDonate?> getVolunteerModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/ru/volunteer-donate/?status=pending&page_size=15",
        token: HiveService.to.getToken(),

      );
      if (response.statusCode == 200) {
        final VolunteerDonate responseModel =
        VolunteerDonate.fromJson(
          response.data);
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  Future<VolunteerDonate?> getItemVolunteerModel() async {
    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/ru/volunteer-donate/?type=CH&page_size=15",
        token: HiveService.to.getToken(),

      );
      if (response.statusCode == 200) {
        final VolunteerDonate responseModel =
        VolunteerDonate.fromJson(
            response.data);
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