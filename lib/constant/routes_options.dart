import 'package:flutter/material.dart';
import 'package:unsplash_flutter/utils/no_animation_page_route.dart';
import 'package:unsplash_flutter/views/collections/collections_view.dart';
import 'package:unsplash_flutter/views/home/home_view.dart';
import 'package:unsplash_flutter/views/login/login_view.dart';
import 'package:unsplash_flutter/views/my/my_view.dart';
import 'package:unsplash_flutter/views/photoDetail/photo_detail_view.dart';
import 'package:unsplash_flutter/layouts/main_layout.dart';

class PageName {
  static const String drawer = "drawer";

  static const String my = 'my';

  static const String home = 'home';

  static const String collections = 'collections';

  static const String login = 'login';

  static const String photoDetail = 'photoDetail';
}

class PageRoutersOptions {

  /// 初始化的路由
  static const String initRoute = PageName.home;

  /// Drawer/二级 路由配置
  static final Map<String, WidgetBuilder> drawerRoutes = {
    PageName.my: (BuildContext context) => const MyView(),
    PageName.home: (BuildContext context) => const HomeView(),
    PageName.collections: (BuildContext context) => const CollectionsView(),
  };

  /// 普通/顶层 路由配置
  static final Map<String, WidgetBuilder> normalRoutes = {
    PageName.login: (BuildContext context) => const LoginView(),
    PageName.photoDetail: (BuildContext context) => const PhotoDetailView(),
  };

  /// 构建 Drawer/二级 路由布局
  static Widget _buildDrawerRouteLayout(BuildContext context) {
    return const MainLayout(child: Navigator(initialRoute: initRoute, onGenerateRoute: generateDrawerRoute));
  }

  /// 生成 普通/顶层 路由
  static Route<dynamic>? generateNormalRoute(RouteSettings settings) {

    bool isNormalRoute = normalRoutes.containsKey(settings.name);

    bool isDrawerRoute = drawerRoutes.containsKey(settings.name);

    if (isDrawerRoute) {
      return MaterialPageRoute(builder: _buildDrawerRouteLayout, settings: settings);
    }

    if (isNormalRoute) {
      return MaterialPageRoute(builder: normalRoutes[settings.name]!, settings: settings);
    }

    throw Exception('Invalid normal route: ${settings.name}');
  }

  ///  生成 Drawer/二级 路由
  static Route<dynamic> generateDrawerRoute(RouteSettings settings) {

    if (drawerRoutes.containsKey(settings.name)) {
      return NoAnimationPageRoute(builder: drawerRoutes[settings.name]!);
    }

    throw Exception('Invalid drawer route: ${settings.name}');
  }
}
