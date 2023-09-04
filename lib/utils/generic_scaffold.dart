import 'package:flutter/material.dart';
import 'generic_bottom_bar.dart';
import 'generic_appbar.dart';

class GenericScaffold extends StatelessWidget {
  const GenericScaffold(
      {required this.bodyWidget,
      this.title,
      this.showBottomBar = true,
      this.showAppBar = true,
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
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: bodyWidget,
              ),
            ],
          ),
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
