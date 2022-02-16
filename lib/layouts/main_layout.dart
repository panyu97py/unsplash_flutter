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
  static const double drawerWidth = 200;

  static const  double avatarSize = 20;

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
                child: Column(
                  children: [
                    buildMainViewAppBar(context),
                    Expanded(
                        child: IgnorePointer(
                            ignoring: isDrawerOpen, child: widget.child!)),
                  ],
                ))));
  }

  Widget buildDrawerView(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(child: Container(color: Colors.red)));
  }

  Widget buildMainViewAppBar(BuildContext context) {

    const String avatarUrl =  'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg';

    BoxDecoration avatarBoxDecoration =  const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 10, //阴影范围
              spreadRadius: 0.1, //阴影浓度
              color: Colors.grey //阴影颜色
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(avatarSize))
    );

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric( vertical: 10, horizontal: AppTheme.viewHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: handleOnMenuIconTap,
              child: AnimatedIcon(
                  icon: AnimatedIcons.arrow_menu,
                  progress: iconAnimationController!)),
          IgnorePointer(
            ignoring: isDrawerOpen,
            child: Container(
              decoration:avatarBoxDecoration,
              child: const CircleAvatar(radius: avatarSize, backgroundImage: NetworkImage(avatarUrl)),
            ),
          )
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