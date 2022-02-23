import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius borderRadiusSize = const Radius.circular(20);
    return Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: borderRadiusSize, topRight: borderRadiusSize)),
        child: const SizedBox(height: 1000));
  }
}
