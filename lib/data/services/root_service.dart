import 'package:get_it/get_it.dart';
import 'package:najot/data/services/crowdfunding_service.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/order_service.dart';
import 'package:najot/data/services/organization_service.dart';
import 'package:najot/data/services/product_service.dart';
import 'package:najot/data/services/rule_service.dart';
import 'package:najot/data/services/storage_service.dart';

import 'about_us_service.dart';
import 'crowdfunding_service.dart';
import 'di_service.dart';
import 'faq_service.dart';
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
    await AboutUsService.init();
    await OrderService.init();
    await FaqService.init();
    await OrganizationService.init();
    await DIService.init();
    await CrowdfundingService.init();
    await ProductService.init();
    await RuleService.init();
  }
  static HttpService get httpService => _getIt.get<HttpService>();
  static HiveService get hiveService => _getIt.get<HiveService>();
  static AboutUsService get aboutService => _getIt.get<AboutUsService>();
  static OrderService get orderService => _getIt.get<OrderService>();
  static OrganizationService get organizationService => _getIt.get<OrganizationService>();
  static ProductService get productService => _getIt.get<ProductService>();
  static RuleService get ruleService => _getIt.get<RuleService>();

}
