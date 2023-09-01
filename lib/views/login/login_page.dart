import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../utils/generic_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      showBottomBar: false,
      bodyWidget: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => context.pushNamed("register"),
                    child: const Text("missing_account").tr(),
                  )
                ],
              ))
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
        ],
      ),
    );
  }
}
