import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView(
      {Key? key,
      this.mainView,
      this.drawerView,
      this.controller,
      this.drawerWidth = 200})
      : super(key: key);

  final Widget? mainView;
  final Widget? drawerView;
  final double drawerWidth;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width + drawerWidth,
          child: Row(
            children: <Widget>[
              // drawerView
              SizedBox(
                width: drawerWidth,
                height: MediaQuery.of(context).size.height,
                child: drawerView,
              ),

              // mainView
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: mainView,
              )
            ],
          ),
        ),
      ),
    );
  }
}