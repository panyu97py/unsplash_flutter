import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlowView extends StatelessWidget {
  const FlowView({Key? key, this.children, this.marginSize}) : super(key: key);

  final List<Widget>? children;
  final double? marginSize;

  @override
  Widget build(BuildContext context) {
    List<Widget> leftList = [];
    List<Widget> rightList = [];

    children?.forEach((element) {
      Widget tempWidget = Container(margin: EdgeInsets.only(bottom: marginSize!), child: element);
      if (leftList.length > rightList.length) return rightList.add(tempWidget);
      leftList.add(tempWidget);
    });

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: Column(children: leftList)), SizedBox(width: marginSize), Expanded(child: Column(children: rightList))]);
  }
}
