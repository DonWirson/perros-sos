import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/loading_progress_indicator.dart';
import '../../../../../core/utils/widgets/generic_scaffold.dart';
import '../../bloc/authentication_bloc.dart';
import '../../bloc/widgets/login_form.dart';

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
        if (state is IsNotLoggedIn) {
          return GenericScaffold(
            showAppBar: true,
            showBottomBar: false,
            title: "Login",
            bodyWidget: LoginForm(),
          );
        }
        return const LoadingProgressIndicator();
      },
    );
  }
}
