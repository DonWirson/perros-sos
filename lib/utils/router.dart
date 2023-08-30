import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
enum Routes {
  landing(path: "/landing", screenWidget: Center()),
  login(path: "/login", screenWidget: Center());

  const Routes({required this.path, required this.screenWidget});

  final String path;
  final Widget screenWidget;
}

