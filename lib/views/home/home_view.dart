import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_flutter/constant/app_theme.dart';
import 'package:unsplash_flutter/components/title_View.dart';
import 'package:unsplash_flutter/api/photo_api_server.dart';
import 'package:unsplash_flutter/model/photo.dart';
import 'package:unsplash_flutter/utils/pageable.dart';
import 'package:unsplash_flutter/components/flow_view.dart';
import 'package:unsplash_flutter/constant/routes_options.dart';
import 'components/search_input.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {

  /// 标题
  static const String title = 'Unsplash';

  /// 副标题
  static const String subTitle = 'Beautiful, free photos.';

  /// 输入框 HintText
  static const String searchInputHintText = "Search photos";

  /// 输入框 controller
  TextEditingController? searchInputController;

  /// 图片搜索关键字
  String? searchText;

  /// 照片列表
  List<Photo> photoList = [];

  /// 接口获取图片列表
  Future getPhotoList() async {
    Response? response = await PhotoApiServer.getPhotoList(pageable: Pageable(pageNum: 1,pageSize: 15));
    List jsonList = response?.data as List;
    setState(() {
      photoList = jsonList.map((photo) => Photo.fromJson(photo)).toList();
    });
  }

  /// 初始化输入框 controller
  void initSearchInputController() {
    searchInputController = TextEditingController();
    searchInputController?.addListener(() {
      setState(() {
        searchText = searchInputController?.text;
      });
    });
  }

  /// 搜索事件
  void handleSearch() {}

  /// 图片点击事件
  void handlePhotoClick(Photo photo) {
    Navigator.of(context, rootNavigator: true).pushNamed(PageName.photoDetail, arguments: photo.id);
  }

  @override
  void initState() {
    getPhotoList();
    initSearchInputController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.viewHorizontalPadding),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleView(title: title, subTitle: subTitle),
                SearchInput(onSearch: handleSearch, controller: searchInputController, hintText: searchInputHintText, margin: const EdgeInsets.only(top: 30)),
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: FlowView(
                        marginSize: 20,
                        imgList: photoList,
                        getImgUrl: (Photo photo) => photo.urls.small,
                        onImgTap: (Photo photo) => handlePhotoClick(photo),
                    ))
              ],
            )));
  }
}
