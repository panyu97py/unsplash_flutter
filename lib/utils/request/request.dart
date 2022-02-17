import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:unsplash_flutter/utils/request/config.dart';

class DioManager {
  static DioManager? _instance;

  static DioManager? getInstance() {
    _instance ??= DioManager._init();
    return _instance;
  }

  Dio? _dio;

  DioManager._init() {
    _dio ??= Dio(BaseOptions(
        baseUrl: RequestConfig.baseUrl,
        connectTimeout: RequestConfig.connectTimeout,
        receiveTimeout: RequestConfig.receiveTimeout));

    _dio!.interceptors.add(DioHttpInterceptor());
  }
}

class DioHttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print(options);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(response);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(err);
    }
    super.onError(err, handler);
  }
}
