import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:perros_sos/utils/generic_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      bodyWidget: Column(children: const [
        Text("Tienes cuenta?"),
        Text("Tienes cuenta?"),
      ]),
    );
  }
}
