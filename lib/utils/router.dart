import 'package:flutter/material.dart';
import 'package:perros_sos/views/views.dart';

enum Routes {
  landing(path: "/", screenWidget: Landing()),
  login(path: "/login", screenWidget: Center());

  const Routes({required this.path, required this.screenWidget});

  final String path;
  final Widget screenWidget;
}
