import 'package:flutter/material.dart';
import 'package:unsplash_flutter/layouts/main_layout.dart';
import 'package:unsplash_flutter/constant/routes_options.dart';
import 'package:unsplash_flutter/utils/no_animation_page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: PageRouters.initRoute,
        onGenerateRoute: generateNormalRoute);
  }

  Route<dynamic>? generateNormalRoute(RouteSettings settings) {
    bool isNormalRoute = PageRouters.normalRoutes.containsKey(settings.name);
    bool isDrawerRoute = PageRouters.drawerRoutes.containsKey(settings.name);
    if (!isNormalRoute && !isDrawerRoute) {
      throw Exception('Invalid normal route: ${settings.name}');
    }
    if (isDrawerRoute) {
      return MaterialPageRoute(builder: PageRouters.normalRoutes[PageName.drawer]!,settings: settings);
    }
    WidgetBuilder? builder = PageRouters.normalRoutes[settings.name];
    return MaterialPageRoute(builder: builder!,settings: settings);
  }
}

class HomeDrawerView extends StatelessWidget {
  const HomeDrawerView({Key? key}) : super(key: key);

  Route<dynamic> generateDrawerRoute(RouteSettings settings) {
    if (!PageRouters.drawerRoutes.containsKey(settings.name)) {
      throw Exception('Invalid drawer route: ${settings.name}');
    }
    WidgetBuilder? builder = PageRouters.drawerRoutes[settings.name];
    return NoAnimationPageRoute(builder: builder!);
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(child: Navigator(initialRoute: PageRouters.initRoute, onGenerateRoute: generateDrawerRoute));
  }
}
