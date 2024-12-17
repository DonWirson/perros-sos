import 'package:flutter/material.dart';

import '../../../../core/gradients/gradients.dart';
import '../../../../core/utils/widgets/generic_scaffold.dart';
import '../widgets/login_page/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      showAppBar: false,
      showBottomBar: false,
      title: "Login_form_title",
      bodyWidget: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Gradients.loginGradient(),
        ),
        child: LoginForm(),
      ),
    );
  }
}
