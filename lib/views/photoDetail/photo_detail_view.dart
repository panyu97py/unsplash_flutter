import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_flutter/api/photo_api_server.dart';
import 'package:unsplash_flutter/model/photo.dart';
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

  /// FutureBuilder 加载
  Future? _future;

  /// 接口获取图片详情
  Future getPhotoDetail(String photoId) async {
    Response? response = await PhotoApiServer.getPhotoDetail(id: photoId);
    setState(() {
      photoDetail = Photo.fromJson(response?.data);
    });
  }

  /// 打开底部弹窗
  void showBottomModal() {
    showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (BuildContext content) => const BottomModal());
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
