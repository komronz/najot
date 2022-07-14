


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';

import '../localization/locale_keys.g.dart';
class NetworkConnectionService {

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<NetworkConnectionService>(NetworkConnectionService());
  }
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }else{
      return true;
    }
  }
  Future<String> textStatus() async {

    if(await checkInternetConnection()){
      return LocaleKeys.connection_success.tr();
    }
    return LocaleKeys.connection_error.tr();
  }
}