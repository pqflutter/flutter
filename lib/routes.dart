import 'package:flutter/material.dart';

import 'header.dart';


class AppRouter {
  static const String initRoute = '/';
  static const String animatedContainer = '/animation/animatedContainer';

  static Map<String, WidgetBuilder> get routes => {
    initRoute: (_) => const RootPage(),
    animatedContainer: (_) => const AnimatedContainerPage(),
  };


  static Future push(BuildContext context, String routeName, [Object? arguments]) {
    return Navigator.of(context).pushNamed(routeName, arguments:arguments);
  }

  static void pop<T>(BuildContext context, [T? result]) => Navigator.of(context).pop(result);
}