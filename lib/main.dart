import 'package:flutter/material.dart';
import 'package:pq_flutter/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRouter.initRoute,
      routes: AppRouter.routes,
    );
  }
}
