import 'package:bloc_example/src/modules/counter/counter.dart';
import 'package:bloc_example/src/modules/mainpage/view/mainpage.dart';
import 'package:bloc_example/src/modules/todos/presentation/pages/todos_page.dart';
import 'package:bloc_example/src/modules/users/view/users_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'paths.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: Paths.login,
        builder: (BuildContext context, GoRouterState state) =>
            const MainPageView()),
    GoRoute(
        path: Paths.counter,
        builder: (BuildContext context, GoRouterState state) =>
            const CounterPage()),
    GoRoute(
        path: Paths.users,
        builder: (BuildContext context, GoRouterState state) =>
            const UsersPage()),

            GoRoute(
        path: Paths.todos,
        builder: (BuildContext context, GoRouterState state) =>
            const TodosPage()),
  ],
);
