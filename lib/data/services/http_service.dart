// 🎯 Dart imports:
import 'dart:convert';
import 'dart:io';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_it/get_it.dart';

import '../../ui/pages/language_page/language_page.dart';
import '../config/const/api_const.dart';
import '../utils/app_logger_util.dart';
import 'auth_service.dart';
import 'navigator_service.dart';

class HttpService {
  Dio? _dio;

  static HttpService get to => GetIt.I<HttpService>();

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<HttpService>(HttpService());
    await getIt<HttpService>().create();
  }

  // final AuthService _authService = AuthService();
  Future create() async {
    if (_dio == null) {
      _dio = Dio();
      (_dio!.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return null;
      };
    }
  }

  Future<Response?> postFile({
    String? path,
    FormData? formData,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    try {
      AppLoggerUtil.d("API: ${APIConst.API_URL + path!}");
      if (token != null) {
        return await _dio!.post(
          path,
          data: formData,
          options: Options(
            headers: {
              "Content-Type": "multipart/from-data",
              'Authorization': 'Bearer ${token}',
            },
          ),
        );
      } else {
        return await _dio!.post(
          APIConst.API_URL + path,
          data: formData,
          options: Options(
            headers: headers,
          ),
        );
      }
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      return null;
    }
  }

  // ignore: missing_return
  Future<Response?> post({
    String? path,
    Map<String, dynamic>? fields,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    try {
      AppLoggerUtil.d("API: ${APIConst.API_URL + path!}");
      if (token != null) {
        return await _dio!.post(
          APIConst.API_URL + path,
          data: jsonEncode(fields),
          options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              'Authorization': 'Bearer ${token}',
            },
          ),
        );
      } else {
        return await _dio!.post(
          APIConst.API_URL + path,
          data: jsonEncode(fields),
          options: Options(
            headers: headers,
          ),
        );
      }
    }on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        var reFresh = await AuthService().reFreshToken();
        if (reFresh != null) {
          var res = await post(
            path: path,
            token: reFresh.access!,
            fields: fields,
            headers: headers,
          );
          return res;
        } else {
          NavigatorService.to.pushNamedAndRemoveUntil(LanguagePage.routeName);
        }
      }
      return e.response;
    }   catch (e) {
      AppLoggerUtil.e(e.toString());
      return null;
    }
  }

  Future<dynamic> get({
    String? path,
    String? url,
    Map<String, dynamic>? parameters,
    String? token,
  }) async {
    try {
      if (url == null) {
        if (parameters == null) {
          if (token == null) {
            return await _dio!.get(APIConst.API_URL + path!);
          } else {
            return await _dio!.get(
              APIConst.API_URL + path!,
              options: Options(
                headers: {"Authorization": "Bearer $token"},
              ),
            );
          }
        }
        return await _dio!.get(
          APIConst.API_URL + path!,
          queryParameters: parameters,
        );
      } else {
        if (parameters == null && token == null) {
          return await _dio!.get(url);
        }
        return await _dio!.get(
          url,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
      }
    }on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        var reFresh = await AuthService().reFreshToken();
        if (reFresh != null) {
          var res = await get(
            path: path,
            token: reFresh.access!,
            url: url,
            parameters: parameters,
          );
          return res;
        } else {
          NavigatorService.to.pushNamedAndRemoveUntil(LanguagePage.routeName);
        }
      }
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
    }
  }

  Future<dynamic> put({
    String? path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? fields,
    String? token,
  }) async {
    try {
      return await _dio!.put(path!,
          options: Options(
            headers: headers,
          ),
          data: jsonEncode(fields));
    }on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        var reFresh = await AuthService().reFreshToken();
        if (reFresh != null) {
          var res = await put(
            path: path,
            token: reFresh.access!,
            fields: fields,
            headers: headers
          );
          return res;
        } else {
          NavigatorService.to.pushNamedAndRemoveUntil(LanguagePage.routeName);
        }
      }
      return e.response;
    }   catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
  }

  Future<dynamic> delete({
    String? path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? fields,
    String? token,
  }) async {
    try {
      return await _dio!.delete(path!,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          data: jsonEncode(fields));
    }on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        var reFresh = await AuthService().reFreshToken();
        if (reFresh != null) {
          var res = await delete(
            path: path,
            token: reFresh.access!,
            fields: fields,
            headers: headers,
          );
          return res;
        } else {
          NavigatorService.to.pushNamedAndRemoveUntil(LanguagePage.routeName);
        }
      }
      return e.response;
    }  catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
  }
}
