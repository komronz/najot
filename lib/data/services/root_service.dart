
import 'package:najot/data/services/storage_service.dart';

import 'di_service.dart';
import 'navigator_service.dart';

class RootService {
  static Future<void> init() async {
    await StorageService.init();
    await DIService.init();
    await NavigatorService.init();
  }
}
