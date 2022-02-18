import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_flutter/constant/app_theme.dart';
import 'package:unsplash_flutter/components/title_View.dart';
import 'package:unsplash_flutter/api/photo_api_server.dart';
import 'package:unsplash_flutter/model/photo.dart';
import 'package:unsplash_flutter/utils/pageable.dart';
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

  @override
  void initState() {
    getPhotoDetail();
    initSearchInputController();
    super.initState();
  }

  Future getPhotoDetail() async {
    Response? response = await PhotoApiServer.getPhotoDetail(id: "z3htkdHUh5w");
    Photo photo = Photo.fromJson(json.decode(response.toString()));
    if (kDebugMode) {
      print(photo.id);
    }
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
                SearchInput(onSearch: handleSearch, controller: searchInputController, hintText: searchInputHintText, margin: const EdgeInsets.only(top: 30))
              ],
            )));
  }
}
