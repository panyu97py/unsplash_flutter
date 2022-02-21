import 'package:flutter/material.dart';

class PhotoDetailView extends StatefulWidget {
  const PhotoDetailView({Key? key}) : super(key: key);

  @override
  _PhotoDetailView createState() => _PhotoDetailView();
}

class _PhotoDetailView extends State<PhotoDetailView> {
  @override
  Widget build(BuildContext context) {
    return Container( color:Colors.white,child: const Center(child: Text("photoDetail")));
  }
}
