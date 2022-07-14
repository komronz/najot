


import 'package:dio/dio.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/root_service.dart';

import '../bloc/language_cubit/language_cubit.dart';
import '../utils/app_logger_util.dart';

class ProductService{



  Future<ProductModel?> getProductsModel() async {

    try {
      final Response response = await RootService.httpService.get(
        url: "https://api.najot.uz/${LanguageCubit.getLang()}/product/",
        token: HiveService.to.getToken()
      );
      print(response.statusCode);
      if (response.statusCode == 200) {

        final ProductModel responseModel =
        ProductModel.fromJson(
          response.data,);
        return responseModel;
      } else {
        AppLoggerUtil.e("-----------------");
        return null;
      }
    } catch (e) {
      AppLoggerUtil.e("-----------------");
      return null;
    }
  }
}