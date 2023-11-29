import 'package:flutter/material.dart';
import 'generic_app_bar.dart';

import 'generic_bottom_bar.dart';

class GenericScaffold extends StatelessWidget {
  const GenericScaffold(
      {required this.bodyWidget,
      this.title,
      this.showAppBar = true,
      this.showBottomBar = false,
      super.key});

  final Widget bodyWidget;
  final String? title;
  final bool showBottomBar;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? GenericAppBar(
              title: title,
            )
          : null,
      //bodyWidget cambia por cada vista
      body: bodyWidget,
      bottomNavigationBar: showBottomBar ? const GenericBottomBar() : null,
    );
  }
}
