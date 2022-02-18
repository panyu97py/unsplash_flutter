import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.src}) : super(key: key);

  final String src;


  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(src)
    );
  }
}
