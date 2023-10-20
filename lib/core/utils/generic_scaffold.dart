import 'package:flutter/material.dart';

import 'generic_appbar.dart';
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
    int selectedIndex = 0;
    return Scaffold(
      appBar: showAppBar
          ? GenericAppBar(
              title: title,
            )
          : null,
      //bodyWidget cambia por cada vista
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.white),
          child: bodyWidget,
        ),
      ),
      bottomNavigationBar: showBottomBar
          ? GenericBottomBar(
              selectedIndex: selectedIndex,
            )
          : null,
    );
  }
}
