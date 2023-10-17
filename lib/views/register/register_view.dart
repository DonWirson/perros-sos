import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:perros_sos/blocs/Authentication/authentication_bloc.dart';
import 'package:perros_sos/core/utils/generic_scaffold.dart';
import 'package:perros_sos/core/widgets/register_form.dart';

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
      bodyWidget: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is RegisterSuccessfull) {
              Fluttertoast.showToast(
                  msg: "REGISTRO EXITOSO!", timeInSecForIosWeb: 2);
              //Despues de mostrar el mensaje redirigir a pagina de landing.....
            }
          },
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
