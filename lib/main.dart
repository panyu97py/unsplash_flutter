import 'package:flutter/material.dart';
import 'package:unsplash_flutter/constant/routes_options.dart';

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
        initialRoute: PageRoutersOptions.initRoute,
        onGenerateRoute: PageRoutersOptions.generateNormalRoute);
  }
}
