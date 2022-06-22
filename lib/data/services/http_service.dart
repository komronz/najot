// 🎯 Dart imports:
import 'dart:convert';
import 'dart:io';

// 📦 Package imports:
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../config/const/api_const.dart';
import '../utils/app_logger_util.dart';

class HttpService {
  Dio? _dio;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<HttpService>(HttpService());
    await getIt<HttpService>().create();
  }

  Future<void> create() async {
    if (_dio == null) {
      _dio = Dio();
      (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return null;
      };
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
      AppLoggerUtil.d("API: ${APIConst.apiUrl + path!}");
      if (token != null) {
        return await _dio!.post(
          APIConst.apiUrl + path,
          options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              'Authorization': 'Bearer $token',
            },
          ),
        );
      } else {
        return await _dio!.post(
          APIConst.apiUrl + path,
          data: jsonEncode(fields),
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
            return await _dio!.get(APIConst.apiUrl + path!);
          } else {
            return await _dio!.get(
              APIConst.apiUrl + path!,
              options: Options(
                headers: {"Authorization": "Bearer $token"},
              ),
            );
          }
        }
        return await _dio!.get(
          APIConst.apiUrl + path!,
          queryParameters: parameters,
        );
      } else {
        if (parameters == null && token == null) return await _dio!.get(url);
        return await _dio!.get(
          url,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
      }
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
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      AppLoggerUtil.e("$e");
      return null;
    }
  }
}
