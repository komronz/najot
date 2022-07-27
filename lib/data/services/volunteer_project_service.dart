


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../bloc/language_cubit/language_cubit.dart';
import '../utils/app_logger_util.dart';
import 'hive_service.dart';
import 'http_service.dart';

class VolunteerProjectService{

  final HttpService _httpService = RootService.httpService;
  Future<bool?> contributionChange(
      int id,

      ) async {
    try {
      final path = 'https://api.najot.uz/ru/volunteer-donate/';
      final body = {
        "project": id,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await _httpService.post(
        path: path,
        fields: body,
        headers: headers,
        token: HiveService.to.getToken()!.access
      );
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
  Future<RootProjectModel?> getVolunteerModel() async {

    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/project/?type=VL&page_size=15",
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
  Future<RootProjectModel?> getProjectsByName(String name) async {

    try {
      final Response response = await RootService.httpService.get(
          url: "https://api.najot.uz/${LanguageCubit.getLang()}/project/?type=VL&search=${name}",
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
}