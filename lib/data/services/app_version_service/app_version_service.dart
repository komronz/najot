import 'package:dio/dio.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionService {
  AppVersionService._init();
  static final AppVersionService _instance = AppVersionService._init();
  static AppVersionService get instance => _instance;

  Future<AppVersionModel?> getVersionInfo() async {

    try {
     Response  response = await RootService.httpService.get(
        path: "https://api.najot.uz/uz/current-version/",
      );
    if (response.statusCode == 200) {
      bool hasUpdate = await checkVersion(nameVersion: response.data.last["name"]);
      return AppVersionModel(
          hasUpdate: hasUpdate, isUrgent: response.data.last["isUrgentUpdate"]);
    }
    
     } catch (e) {
      AppLoggerUtil.e(e.toString());
    }

    return AppVersionModel(hasUpdate: false, isUrgent: false);
  }
  

  Future<bool> checkVersion({required String nameVersion}) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    bool hasUpdate = packageInfo.version == nameVersion ? false : true;
    return hasUpdate;
  }
}

class AppVersionModel {
  bool hasUpdate;
  bool isUrgent;

  AppVersionModel({
    required this.hasUpdate,
    required this.isUrgent,
  });


  
}
