import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/widgets/generic_scaffold.dart';
import '../../bloc/authentication_bloc.dart';
import '../../bloc/widgets/login_page/login_background.dart';
import '../../bloc/widgets/login_page/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is IsLoggedIn) {
          context.pushReplacementNamed("landing");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Esta actualmente logeado :D',
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        return GenericScaffold(
          showAppBar: false,
          showBottomBar: false,
          title: "Login",
          bodyWidget: LoginBackground(
            stackBody: LoginForm(),
          ),
        );
      },
    );
  }
}
