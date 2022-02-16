import 'package:flutter/material.dart';
import 'package:unsplash_flutter/app_theme.dart';
import 'package:unsplash_flutter/components/drawer_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> with TickerProviderStateMixin {
  static double drawerWidth = 200;

  AnimationController? iconAnimationController;

  ScrollController? scrollController;

  bool isDrawerOpen = false;

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: drawerWidth);

    iconAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 0));

    iconAnimationController?.animateTo(1.0, duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);

    scrollController!.addListener(() {

      iconAnimationController?.animateTo(scrollController!.offset / drawerWidth, duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);

      if (![0.0, drawerWidth].any((element) => element == scrollController?.offset)) return;

      setState(() {
        isDrawerOpen = scrollController?.offset == 0.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerView(
        drawerWidth: drawerWidth,
        controller: scrollController,
        drawerView: buildDrawerView(context),
        mainView: Container(
            color: Colors.white,
            child: SafeArea(
                bottom: false,
                child: Stack(
                  children: [
                    IgnorePointer(ignoring: isDrawerOpen, child: widget.child!),
                    buildMainViewAppBar(context)
                  ],
                ))));
  }

  Widget buildDrawerView(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(child: Container(color: Colors.red)));
  }

  Widget buildMainViewAppBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: AppTheme.viewPadding,
      child: Row(
        children: [
          InkWell(
              onTap: handleOnMenuIconTap,
              child: AnimatedIcon(
                  icon: AnimatedIcons.arrow_menu,
                  progress: iconAnimationController!))
        ],
      ),
    );
  }

  void handleOnMenuIconTap() {
    scrollController?.animateTo(
      isDrawerOpen ? drawerWidth : 0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }
}
