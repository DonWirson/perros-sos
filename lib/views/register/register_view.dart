import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:perros_sos/views/landing/landing_page.dart';
import 'package:perros_sos/views/login/login_view.dart';
import '../../blocs/Authentication/authentication_bloc.dart';
import '../../core/utils/generic_scaffold.dart';
import '../../core/widgets/register_form.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      showBottomBar: false,
      bodyWidget: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is RegisterSuccessful) {
            Fluttertoast.showToast(
                msg: "REGISTRO EXITOSO!,REDIRIGIENDO", timeInSecForIosWeb: 2);
          }
        },
        child: const RegisterForm(),
      ),
    );
  }
}
