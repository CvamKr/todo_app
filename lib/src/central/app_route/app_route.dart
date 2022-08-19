import 'package:flutter/material.dart';

import '../../pages/add_todo_page/add_todo_page.dart';
import '../../pages/all_todos_page/all_todos_page.dart';
import '../../pages/login_page/login_page.dart';
import 'route_args.dart';

class AppRoute {
  static const String allTodosRoute = '/AllTodosPage';
  static const String loginPageRoute = '/LoginPage';
  static const String addTodoRoute = '/AddTodoPage';
  static onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case allTodosRoute:
            return const AllTodosPage();
          case loginPageRoute:
            return LoginPage();
          case addTodoRoute:
            final args = routeSettings.arguments as AddTodoArgs;
            return AddTodoPage(appBarTitle: args.appBarTitle);
          default:
            return const Scaffold(
                body: Center(child: Text("404 Page not found!")));
        }
      },
    );
  }
}
