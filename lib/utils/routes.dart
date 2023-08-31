import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perros_sos/views/views.dart';

enum Routes {
  landing(name: "landing", path: "/", screenWidget: LandingPage()),
  login(name: "login", path: "/login", screenWidget: LoginPage()),
  register(name: "register", path: "/register", screenWidget: RegisterPage());

  //No utilizado para que constructor de main siga como const
  GoRouter get getRoutes {
    return GoRouter(
      initialLocation: "/",
      routes: Routes.values
          .map((route) => GoRoute(
                path: route.path,
                name: route.name,
                builder: (context, state) => route.screenWidget,
              ))
          .toList(),
    );
  }

  const Routes(
      {required this.name, required this.path, required this.screenWidget});

  final String name;
  final String path;
  final Widget screenWidget;
}
