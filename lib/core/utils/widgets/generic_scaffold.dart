import 'package:flutter/material.dart';

import 'generic_app_bar.dart';
import 'generic_bottom_bar.dart';

class GenericScaffold extends StatelessWidget {
  const GenericScaffold({
    required this.bodyWidget,
    required this.showAppBar,
    required this.showBottomBar,
    this.title,
    this.appBarWidget,
    this.bottomBarWidget,
    super.key,
  });

  final Widget bodyWidget;
  final String? title;
  final Widget? bottomBarWidget;
  final PreferredSizeWidget? appBarWidget;
  final bool showAppBar;
  final bool showBottomBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? (appBarWidget ??
              GenericAppBar(
                title: title,
              ))
          : null,
      body: bodyWidget,
      bottomNavigationBar:
          showBottomBar ? (bottomBarWidget ?? const GenericBottomBar()) : null,
    );
  }
}
