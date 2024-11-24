import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/register_page.dart';
import '../../features/stray_dog/presentation/pages/landing/landing.dart';

enum Routes {
  landing(
    name: "landing",
    path: "/",
    icon: Icon(Icons.home),
    screenWidget: LandingPage(),
  ),
  login(
    name: "login",
    path: "/login",
    icon: Icon(Icons.person),
    screenWidget: LoginPage(),
  ),
  register(
    name: "register",
    path: "/register",
    icon: Icon(Icons.person_add_alt_1_rounded),
    screenWidget: RegisterPage(),
  ),
  //Lost dog Grid
  grid(
    name: "grid",
    path: "/grid",
    icon: Icon(Icons.grid_view_sharp),
    screenWidget: RegisterPage(),
  ),
  map(
    name: "map",
    path: "/map",
    icon: Icon(Icons.map),
    screenWidget: RegisterPage(),
  ),
  settings(
    name: "settings",
    path: "/settings",
    icon: Icon(Icons.map),
    screenWidget: RegisterPage(),
  );

  static GoRouter get getroutes {
    return GoRouter(
      initialLocation: "/login",
      routes: Routes.values
          .map((route) => GoRoute(
                path: route.path,
                name: route.name,
                builder: (context, state) => route.screenWidget,
              ))
          .toList(),
    );
  }

  //Items de la barra de navegación.
  static List<BottomNavigationBarItem> get bottomBarItems {
    return [
      BottomNavigationBarItem(
        label: Routes.landing.name.tr(),
        icon: Routes.landing.icon,
      ),
      BottomNavigationBarItem(
        label: Routes.grid.name.tr(),
        icon: Routes.grid.icon,
      ),
      BottomNavigationBarItem(
        label: Routes.settings.name.tr(),
        icon: Routes.settings.icon,
      ),
    ];
  }

  const Routes(
      {required this.name,
      required this.path,
      required this.icon,
      required this.screenWidget});
  final String name;
  final Icon icon;
  final String path;
  final Widget screenWidget;
}
