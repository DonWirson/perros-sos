import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Authentication/authentication_bloc.dart';
import '../landing/landing_page.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: BlocProvider.of<AuthenticationBloc>(context).userStream,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          log("SNAPSHOT CON DATA");
          return const LandingPage();
        } else {
          log("SNAPSHOT SIN DATA");
          return const LoginView();
        }
      },
    );
  }
}
