import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      appBar: !showAppBar
          ? null
          : AppBar(
              title: title == null ? null : const Text(""),
              //muestra backbutton en caso de ser posible hacer pop
              leading: context.canPop()
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => context.pop(),
                    )
                  : null,
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => context.goNamed("settings"),
                ),
              ],
              elevation: 2.0,
            ),
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
      //Navigation bar se usa en la mayoría de vistas
      bottomNavigationBar: !showBottomBar
          ? null
          : BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: Colors.amber[800],
            ),
    );
  }
}
