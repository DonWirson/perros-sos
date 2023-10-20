import 'package:flutter/material.dart';

import '../../core/utils/generic_scaffold.dart';
import '../../core/widgets/forms/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      bodyWidget: LoginForm(),
    );
  }
}
