import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perros_sos/utils/generic_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      showBottomBar: false,
      bodyWidget: Column(
        children: [
          // TextFormField(
          //   decoration: const InputDecoration(
          //     border: UnderlineInputBorder(),
          //     labelText: 'ingresa tu usuario',
          //   ),
          // ),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     border: UnderlineInputBorder(),
          //     labelText: 'Ingresa tu contraseña',
          //   ),
          // ),
          ElevatedButton(
              onPressed: () => context.pushNamed("register"),
              child: const Text("missing_account").tr())
        ],
      ),
    );
  }
}
