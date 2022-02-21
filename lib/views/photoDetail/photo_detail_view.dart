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
  Photo? photoDetail;
  Future? _future;

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

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.black,
        child: Center(
            child: FutureBuilder(
                future: _future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    String? photoUrl = photoDetail?.urls.full;
                    return Image.network(photoUrl!);
                  } else {
                    return const CircularProgressIndicator(color: Colors.white,);
                  }
                })));
  }
}
