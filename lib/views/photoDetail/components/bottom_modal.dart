import 'package:flutter/material.dart';
import 'package:unsplash_flutter/components/flow_view.dart';
import 'package:unsplash_flutter/constant/custom_icons.dart';
import 'package:unsplash_flutter/model/photo.dart';
import 'package:unsplash_flutter/model/user.dart';
import 'package:unsplash_flutter/components/image_view.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({Key? key, this.authorDetail, required this.authorPhotoList}) : super(key: key);

  /// 作者详情
  final User? authorDetail;

  /// 作者作品列表
  final List<Photo> authorPhotoList;

  /// 头像尺寸
  static const double avatarSize = 20;

  /// 头像路径
  static const String avatarUrl = 'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg';

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

  @override
  Widget build(BuildContext context) {
    Radius borderRadiusSize = const Radius.circular(20);
    Widget userInfoAndOperateWidget = buildUserInfoAndOperate(context);
    List<Widget> imgList = authorPhotoList
        .map((Photo photo) => ImageView(
              src: photo.urls.small!,
            ))
        .toList();

    return Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: borderRadiusSize, topRight: borderRadiusSize)),
        child: SizedBox(
            height: 1000,
            child: Column(children: [
              userInfoAndOperateWidget,
              Expanded(child: SingleChildScrollView(child: FlowView(children: imgList))),
            ])));
  }
}
