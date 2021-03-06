import 'package:flutter/material.dart';
import 'package:unsplash_flutter/components/flow_view.dart';
import 'package:unsplash_flutter/constant/custom_icons.dart';
import 'package:unsplash_flutter/model/photo.dart';
import 'package:unsplash_flutter/model/user.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({Key? key, required this.authorDetail, required this.authorPhotoList, this.onDownLoad, this.onImgTap}) : super(key: key);

  /// 作者详情
  final User authorDetail;

  /// 作者作品列表
  final List<Photo> authorPhotoList;

  /// 点击下载事件
  final VoidCallback? onDownLoad;

  final Function? onImgTap;

  /// 操作卡片
  Widget buildOperate(BuildContext context) {
    return Row(children: [
      Container(margin: const EdgeInsets.only(right: 15), child: InkWell(onTap: onDownLoad, child: const Icon(CustomIcons.download))),
      const InkWell(child: Icon(CustomIcons.like))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Radius borderRadiusSize = const Radius.circular(20);

    return Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: borderRadiusSize, topRight: borderRadiusSize)),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  UserInfoCard(userDetail: authorDetail),
                  buildOperate(context),
                ]),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: FlowView(imgList: authorPhotoList, getImgUrl: (Photo photo) => photo.urls.small, onImgTap: (Photo photo) => onImgTap!(photo)))),
            ])));
  }
}

/// 用户信息卡片
class UserInfoCard extends StatelessWidget {
  const UserInfoCard({Key? key, required this.userDetail, this.onTap}) : super(key: key);

  final User userDetail;

  final VoidCallback? onTap;

  static const double avatarSize = 24;

  @override
  Widget build(BuildContext context) {
    String? avatarUrl = userDetail.profileImage?.medium;

    BoxDecoration avatarBoxDecoration = const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 10, //阴影范围
              spreadRadius: 0.1, //阴影浓度
              color: Colors.grey //阴影颜色
              )
        ],
        borderRadius: BorderRadius.all(Radius.circular(avatarSize)));

    return InkWell(
        onTap: onTap,
        child: Row(children: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: avatarBoxDecoration,
              child: CircleAvatar(radius: avatarSize, backgroundImage: NetworkImage(avatarUrl!))),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(userDetail.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("@${userDetail.username}", style: const TextStyle(color: Colors.grey, fontSize: 14))
          ])
        ]));
  }
}
