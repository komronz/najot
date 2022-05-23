
import 'package:get_it/get_it.dart';
import 'package:najot/data/services/crowdfunding_service.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/storage_service.dart';

import 'di_service.dart';
import 'navigator_service.dart';

class RootService {
  static final _getIt = GetIt.instance;

  static Future init() async {
    if (!_getIt.isRegistered<RootService>()) {
      _getIt.registerSingleton<RootService>(RootService());
      await _getIt<RootService>().initServices();
    }
  }
  Future initServices() async {
    await StorageService.init();
    await NavigatorService.init();
    await HiveService.init();
    await HttpService.init();
    await DIService.init();
    await CrowdfundingService.init();
  }
  static HttpService get httpService => _getIt.get<HttpService>();
}
