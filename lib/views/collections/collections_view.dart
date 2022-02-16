import 'package:flutter/material.dart';
import 'package:unsplash_flutter/routes_options.dart';

class CollectionsView extends StatefulWidget {
  const CollectionsView({Key? key}) : super(key: key);

  @override
  _CollectionsView createState() => _CollectionsView();
}

class _CollectionsView extends State<CollectionsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
          child: InkWell(
              child: const Text('toHomeView'),
              onTap: () {
                Navigator.of(context).pushNamed(PageName.home);
              })),
    );
  }
}
