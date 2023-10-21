import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import '../../blocs/Authentication/authentication_bloc.dart';
import '../landing/landing_page.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          // Fluttertoast.showToast(
          //   msg: "Error al iniciar sesión",
          // );
        }
        // if (state is LoginSuccessful) {
        //   context.pop();
        // }
      },
      child: StreamBuilder<User?>(
        stream: BlocProvider.of<AuthenticationBloc>(context).userStream,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            log("SNAPSHOT CON DATA");
            return const LandingPage();
          } else {
            log("SNAPSHOT SIN DATA");
            return const LandingPage();
          }
        },
      ),
    );
  }
}
