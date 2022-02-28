import 'package:dio/dio.dart';
import 'package:unsplash_flutter/utils/pageable.dart';
import 'package:unsplash_flutter/utils/request/request.dart';

class UserApiServer {
  UserApiServer._();

  /// 获取用户公开信息
  static Future<Response>? getUserPublicProfile(String username) => DioManager.getDioInstance()?.get("/users/$username");

  /// 获取用户图片列表
  static Future<Response>? getUserPhotoList({required String username, required Pageable pageable}) {
    return DioManager.getDioInstance()?.get("/users/$username/photos", queryParameters: pageable.toMap());
  }

}
