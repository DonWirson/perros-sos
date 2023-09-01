import 'package:flutter/material.dart';
import '../../utils/generic_scaffold.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericScaffold(
      title: "Inicio",
      bodyWidget: Center(),
    );
  }
}
