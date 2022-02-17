import 'package:flutter/material.dart';
import 'package:unsplash_flutter/app_theme.dart';
import 'package:unsplash_flutter/components/title_View.dart';
import 'package:unsplash_flutter/utils/request/request.dart';
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
    DioManager.getDioInstance()?.get("http://www.baidu.com");
    initSearchInputController();
    super.initState();
  }

  void initSearchInputController() {
    searchInputController = TextEditingController();
    searchInputController?.addListener(() {
      setState(() {
        searchText = searchInputController?.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.viewHorizontalPadding),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleView(title: title, subTitle: subTitle),
                SearchInput(
                    controller: searchInputController,
                    hintText: searchInputHintText,
                    margin: const EdgeInsets.only(top: 30))
              ],
            )));
  }
}
