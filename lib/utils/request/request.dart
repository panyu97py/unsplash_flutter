import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:unsplash_flutter/utils/request/config.dart';

class DioManager {
  static DioManager? _instance;

  Dio? _dio;

  static DioManager? getInstance() {
    _instance ??= DioManager._init();
    return _instance;
  }

  static Dio? getDioInstance() {
    return getInstance()?._dio;
  }

  DioManager._init() {
    _dio ??= Dio(BaseOptions(
        baseUrl: RequestConfig.baseUrl,
        connectTimeout: RequestConfig.connectTimeout,
        receiveTimeout: RequestConfig.receiveTimeout));

    CookieJar cookieJarInterceptor = CookieJar();
    _dio!.interceptors.add(CookieManager(cookieJarInterceptor));
    _dio!.interceptors.add(DioHttpInterceptor());
  }
}

class DioHttpInterceptor extends Interceptor {

  static const String defaultAuthorization = "Client-ID " + RequestConfig.accessKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.headers['Accept-Version'] = "v1";

    options.headers['Authorization'] = defaultAuthorization;

    if (kDebugMode) {
      print(options.uri);
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
