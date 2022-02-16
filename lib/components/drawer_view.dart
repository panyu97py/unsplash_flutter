import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatefulWidget {
  const DrawerView(
      {Key? key,
      this.drawerIsOpen,
      this.mainView,
      this.drawerView,
      this.drawerWidth = 200})
      : super(key: key);

  final Widget? mainView;
  final Widget? drawerView;
  final double drawerWidth;
  final Function(bool)? drawerIsOpen;

  @override
  _DrawerView createState() => _DrawerView();
}

class _DrawerView extends State<DrawerView> {

  ScrollController? scrollController;
  double scrollOffset = 0.0;

  @override
  void initState(){
    scrollController = ScrollController(initialScrollOffset: widget.drawerWidth);
    scrollController!.addListener(() {

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width + widget.drawerWidth,
          child: Row(
            children: <Widget>[

              // drawerView
              SizedBox(
                width: widget.drawerWidth,
                height: MediaQuery.of(context).size.height,
                child: widget.drawerView,
              ),

              // mainView
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: widget.mainView,
              )
            ],
          ),
        ),
      ),
    );
  }
}
