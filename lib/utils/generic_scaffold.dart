import 'package:flutter/material.dart';

class GenericScaffold extends StatelessWidget {
  const GenericScaffold(
      {required this.bodyWidget, this.showBottomBar = true, super.key});

  final Widget bodyWidget;
  final bool showBottomBar;
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      //Body cambia por cada vista
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: bodyWidget),
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
