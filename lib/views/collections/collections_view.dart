import 'package:flutter/material.dart';
import 'package:unsplash_flutter/app_theme.dart';
import 'package:unsplash_flutter/components/title_View.dart';

class CollectionsView extends StatefulWidget {
  const CollectionsView({Key? key}) : super(key: key);

  @override
  _CollectionsView createState() => _CollectionsView();
}

class _CollectionsView extends State<CollectionsView> {
  final String title = 'Collections';
  final String subTitle = 'Explore the world through collections of beautiful HD pictures';

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
