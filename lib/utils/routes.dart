import 'package:flutter/material.dart';
import '../views/views.dart';

enum Routes {
  landing(name: "landing", path: "/", screenWidget: CountrySelect()),
  login(name: "login", path: "/login", screenWidget: LoginPage()),
  register(name: "register", path: "/register", screenWidget: RegisterPage()),
  settings(name: "settings", path: "/settings", screenWidget: SettingsPage());

  const Routes(
      {required this.name, required this.path, required this.screenWidget});

  final String name;
  final String path;
  final Widget screenWidget;
}
