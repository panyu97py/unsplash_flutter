import 'package:dio/dio.dart';
import 'package:unsplash_flutter/utils/request/request.dart';
import 'package:unsplash_flutter/utils/pageable.dart';

class PhotoApiServer {
  /// 获取照片列表
  static Future<Response>? getPhotoList({Pageable? pageable}) => DioManager.getDioInstance()?.get("/photos", queryParameters: pageable?.toMap());

  /// 获取照片详情
  static Future<Response>? getPhotoDetail({required String id}) => DioManager.getDioInstance()?.get("/photos/$id");
}
