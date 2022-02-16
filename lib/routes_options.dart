import 'package:flutter/cupertino.dart';
import 'package:unsplash_flutter/views/collections/collections_view.dart';
import 'package:unsplash_flutter/views/home/home_view.dart';
import 'package:unsplash_flutter/views/login/login_view.dart';
import 'package:unsplash_flutter/views/my/my_view.dart';
import 'package:unsplash_flutter/views/photoDetail/photo_detail_view.dart';

class PageName {

  static const String my = 'my';

  static const String home = 'home';

  static const String collections = 'collections';

  static const String login = 'login';

  static const String photoDetail = 'photoDetail';
}

class PageRouters {

  static const String initRoute = PageName.collections;

  static final Map<String, WidgetBuilder> drawerRoutes = {

    PageName.my: (BuildContext context) => const MyView(),

    PageName.home: (BuildContext context) => const HomeView(),

    PageName.collections: (BuildContext context) => const CollectionsView(),

  };

  static final Map<String, WidgetBuilder> normalRoutes = {

    PageName.login: (BuildContext context) => const LoginView(),

    PageName.photoDetail: (BuildContext context) => const PhotoDetailView()

  };
}
