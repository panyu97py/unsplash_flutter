import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.src, this.margin}) : super(key: key);

  final String src;

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(src)
      ),
    );
  }
}
