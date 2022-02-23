import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_flutter/api/photo_api_server.dart';
import 'package:unsplash_flutter/model/photo.dart';

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

  @override
  void initState() {
    setState(() {
      _future = getPhotoDetail(widget.photoId);
    });
    super.initState();
  }

  void showBottomModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext content) {
          return Container(color: Colors.white);
        });
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

                  if (snapshot.connectionState == ConnectionState.done) {
                    String? photoUrl = photoDetail?.urls.full;
                    return InkWell(
                        onLongPress: showBottomModal,
                        child: InteractiveViewer(child: CachedNetworkImage(placeholder: (context, url) => loadingWidget, imageUrl: photoUrl!)));
                  } else {
                    return loadingWidget;
                  }
                })));
  }
}
