import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perros_sos/core/utils/widgets/generic_scaffold.dart';
import 'package:perros_sos/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:perros_sos/features/authentication/presentation/bloc/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      bodyWidget: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is RegisterSuccessful) {
            // Fluttertoast.showToast(
            //     msg: "REGISTRO EXITOSO!,REDIRIGIENDO", timeInSecForIosWeb: 2);
          }
        },
        child: RegisterForm(),
      ),
    );
  }
}
