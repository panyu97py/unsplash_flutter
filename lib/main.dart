import 'package:flutter/material.dart';
import 'package:unsplash_flutter/layouts/main_layout.dart';
import 'package:unsplash_flutter/routes_options.dart';
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
        home: MainLayout(
            child: Navigator(
                initialRoute: PageRouters.initRoute,
                onGenerateRoute: generateDrawerRoute)));
  }

  Route<dynamic> generateDrawerRoute(RouteSettings settings) {
    if (!PageRouters.drawerRoutes.containsKey(settings.name)) {
      throw Exception('Invalid route: ${settings.name}');
    }
    WidgetBuilder? builder = PageRouters.drawerRoutes[settings.name];
    return NoAnimationPageRoute(builder: builder!);
  }
}
