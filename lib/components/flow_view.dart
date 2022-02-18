import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlowView extends StatelessWidget {
  const FlowView({Key? key, this.children}) : super(key: key);

  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    List<Widget> leftList = [];
    List<Widget> rightList = [];

    children?.forEach((element) {
      if (leftList.length > rightList.length) return rightList.add(element);
      leftList.add(element);
    });

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: Column(children: leftList)), const SizedBox(width: 20), Expanded(child: Column(children: rightList))]);
  }
}
