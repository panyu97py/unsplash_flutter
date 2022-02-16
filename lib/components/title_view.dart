import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 30,
            ),
          )),
      Text(subTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 18,
          ))
    ]);
  }
}
