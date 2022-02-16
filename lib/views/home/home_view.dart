import 'package:flutter/material.dart';
import 'package:unsplash_flutter/app_theme.dart';
import 'package:unsplash_flutter/components/title_View.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  final String title = 'Unsplash';
  final String subTitle = 'Beautiful,free photos.';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.viewHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [TitleView(title: title, subTitle: subTitle)],
        ));
  }
}
