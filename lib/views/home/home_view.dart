import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_flutter/components/image_view.dart';
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
  static const String title = 'Unsplash';
  static const String subTitle = 'Beautiful, free photos.';
  static const String searchInputHintText = "Search photos";

  TextEditingController? searchInputController;
  String? searchText;

  /// 照片列表
  List<Photo> photoList = [];

  @override
  void initState() {
    getPhotoList();
    initSearchInputController();
    super.initState();
  }

  Future getPhotoList() async {
    Response? response = await PhotoApiServer.getPhotoList();
    List jsonList = response?.data as List;
    setState(() {
      photoList = jsonList.map((photo) => Photo.fromJson(photo)).toList();
    });
  }

  void initSearchInputController() {
    searchInputController = TextEditingController();
    searchInputController?.addListener(() {
      setState(() {
        searchText = searchInputController?.text;
      });
    });
  }

  void handleSearch() {}

  void handlePhotoClick(Photo photo) {
    Navigator.of(context).pushNamed(PageName.photoDetail, arguments: {"id": photo.id});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imgList = photoList
        .map((Photo photo) => ImageView(
              src: photo.urls.small!,
              onTap: () => handlePhotoClick(photo),
            ))
        .toList();

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
                      children: imgList,
                      marginSize: 20,
                    ))
              ],
            )));
  }
}
