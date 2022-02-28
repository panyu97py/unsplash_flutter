import 'package:flutter/material.dart';
import 'package:unsplash_flutter/constant/custom_icons.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({Key? key, Widget? child}) : super(key: key);

  static const double avatarSize = 20;

  static const String avatarUrl = 'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg';

  @override
  Widget build(BuildContext context) {
    Radius borderRadiusSize = const Radius.circular(20);

    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: borderRadiusSize, topRight: borderRadiusSize)),
        child: SizedBox(height: 1000, child: Column(children: [buildUserInfoAndOperate(context)])));
  }

  /// 用户信息及操作卡片
  Widget buildUserInfoAndOperate(BuildContext context) {
    return Row(children: [
      const CircleAvatar(radius: avatarSize, backgroundImage: NetworkImage(avatarUrl)),
      Column(
        children: const [Text('data'), Text('data')],
      ),
      const Icon(CustomIcons.download),
      const Icon(CustomIcons.like),
      const Icon(CustomIcons.alreadyLike),
    ]);
  }
}
