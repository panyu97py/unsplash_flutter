import 'package:flutter/material.dart';
import 'package:unsplash_flutter/utils/no_animation_page_route.dart';
import 'package:unsplash_flutter/views/collections/collections_view.dart';
import 'package:unsplash_flutter/views/home/home_view.dart';
import 'package:unsplash_flutter/views/login/login_view.dart';
import 'package:unsplash_flutter/views/my/my_view.dart';
import 'package:unsplash_flutter/views/photoDetail/photo_detail_view.dart';
import 'package:unsplash_flutter/layouts/main_layout.dart';

class PageName {

  /// 个人中心
  static const String my = 'my';

  /// 首页
  static const String home = 'home';

  /// 收藏页
  static const String collections = 'collections';

  /// 登陆页
  static const String login = 'login';

  /// 图片详情页
  static const String photoDetail = 'photoDetail';
}

class PageRoutersOptions {
  /// 初始化的路由
  static const String initRoute = PageName.home;

  /// Drawer/二级 路由配置
  static final Map<String, Function> drawerRoutes = {
    PageName.my: (Object? arguments) => const MyView(),
    PageName.home: (Object? arguments) => const HomeView(),
    PageName.collections: (Object? arguments) => const CollectionsView(),
  };

  /// 普通/顶层 路由配置
  static final Map<String, Function> normalRoutes = {
    PageName.login: (Object? arguments) => const LoginView(),
    PageName.photoDetail: (Object arguments) => PhotoDetailView(photoId: arguments as String),
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
      return MaterialPageRoute(builder: (BuildContext context) => normalRoutes[settings.name]!(settings.arguments), settings: settings);
    }

    throw Exception('Invalid normal route: ${settings.name}');
  }

  ///  生成 Drawer/二级 路由
  static Route<dynamic> generateDrawerRoute(RouteSettings settings) {
    if (drawerRoutes.containsKey(settings.name)) {
      return NoAnimationPageRoute(builder: (BuildContext context) => drawerRoutes[settings.name]!(settings.arguments));
    }

    throw Exception('Invalid drawer route: ${settings.name}');
  }
}
