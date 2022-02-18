import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.src, this.onTap}) : super(key: key);

  final String src;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(src)));
  }
}
