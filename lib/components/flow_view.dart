import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'image_view.dart';

class FlowView extends StatelessWidget {
  const FlowView({Key? key, this.imgList, this.marginSize = 20, this.onImgTap, required this.getImgUrl}) : super(key: key);

  final List<Object>? imgList;

  final double? marginSize;

  final Function? onImgTap;

  final Function getImgUrl;

  @override
  Widget build(BuildContext context) {
    List<Widget> leftList = [];
    List<Widget> rightList = [];

    imgList?.forEach((element) {
      Widget tempWidget = Container(margin: EdgeInsets.only(bottom: marginSize!), child: ImageView(src: getImgUrl(element), onTap: () => onImgTap!(element)));
      if (leftList.length > rightList.length) return rightList.add(tempWidget);
      leftList.add(tempWidget);
    });

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: Column(children: leftList)), SizedBox(width: marginSize), Expanded(child: Column(children: rightList))]);
  }
}
