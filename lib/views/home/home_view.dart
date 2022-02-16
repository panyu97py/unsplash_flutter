import 'package:flutter/material.dart';
import 'package:unsplash_flutter/routes_options.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
          child: InkWell(
              child: const Text('toCollectionsView'),
              onTap: () {
                Navigator.of(context).pushNamed(PageName.collections);
              })),
    );
  }
}
