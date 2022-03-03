import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najot/ui/pages/counter_page/counter_page.dart';
import 'package:najot/ui/pages/loading_page/loading_page.dart';

class AppRouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoadingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoadingPage(),
        );
      case CounterPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => CounterPage(),
        );
    }
  }
}
