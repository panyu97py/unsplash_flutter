import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_flutter/api/photo_api_server.dart';
import 'package:unsplash_flutter/api/user_api_server.dart';
import 'package:unsplash_flutter/model/photo.dart';
import 'package:unsplash_flutter/model/user.dart';
import 'package:unsplash_flutter/utils/pageable.dart';
import 'components/bottom_modal.dart';

class PhotoDetailView extends StatefulWidget {
  const PhotoDetailView({Key? key, required this.photoId}) : super(key: key);

  final String photoId;

  @override
  PhotoDetailViewState createState() => PhotoDetailViewState();
}

class PhotoDetailViewState extends State<PhotoDetailView> {
  /// 图片详情
  Photo? photoDetail;

  /// 图片作者详情
  User? authorDetail;

  /// 图片作者详情
  List<Photo> authorPhotoList = [];

  /// FutureBuilder 加载
  Future? _future;

  /// 接口获取图片详情
  Future getPhotoDetail(String photoId) async {
    Response? response = await PhotoApiServer.getPhotoDetail(id: photoId);
    setState(() {
      photoDetail = Photo.fromJson(response?.data);
    });
  }

  /// 接口获取作者详情
  Future getAuthorDetail(String username) async {
    Response? response = await UserApiServer.getUserPublicProfile(username);
    setState(() {
      authorDetail = User.fromJson(response?.data);
    });
  }

  /// 接口获取作者作品列表
  Future getAuthorPhotoList({required String username, required Pageable pageable}) async {
    Response? response = await UserApiServer.getUserPhotoList(username: username, pageable: pageable);
    List jsonList = response?.data as List;
    List<Photo> photoList = jsonList.map((json) => Photo.fromJson(json)).toList();
    setState(() {
      authorPhotoList = photoList;
    });
  }

  /// 打开底部弹窗
  void showBottomModal() async {
    String? username = photoDetail?.user.username;
    await getAuthorDetail(username!);
    await getAuthorPhotoList(username: username, pageable: Pageable());
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext content) {
          return BottomModal(authorDetail: authorDetail!, authorPhotoList: authorPhotoList);
        });
  }

  @override
  void initState() {
    setState(() {
      _future = getPhotoDetail(widget.photoId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
                future: _future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Widget loadingWidget = const Center(child: CircularProgressIndicator(color: Colors.white));

                  if (snapshot.connectionState != ConnectionState.done) return loadingWidget;

                  String? photoUrl = photoDetail?.urls.full;

                  return InkWell(
                      onLongPress: showBottomModal,
                      child: InteractiveViewer(child: CachedNetworkImage(placeholder: (context, url) => loadingWidget, imageUrl: photoUrl!)));
                })));
  }
}
