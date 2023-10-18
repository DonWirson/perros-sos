import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perros_sos/blocs/Authentication/authentication_bloc.dart';
import 'package:perros_sos/core/widgets/register_form.dart';
import 'package:perros_sos/views/landing/landing_page.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: BlocProvider.of<AuthenticationBloc>(context).userStream,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const LandingPage();
        }
        return const LoginView();
      },
    );
  }
}
