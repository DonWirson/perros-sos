import 'package:flutter/material.dart';
import '../../utils/generic_scaffold.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericScaffold(
      title: "Inicio",
      bodyWidget: Center(),
    );
  }
}
