import 'package:flutter/material.dart';
import 'package:unsplash_flutter/routes_options.dart';
import 'package:unsplash_flutter/utils/utils.dart';
import 'components/drawer_view.dart';

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
        home: DrawerView(
            drawerView: buildDrawerView(context),
            mainView: buildMainView(context)));
  }

  Widget buildDrawerView(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(child: Container(color: Colors.red)));
  }

  Widget buildMainView(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
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
