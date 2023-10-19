import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../utils/text_form_field_generic.dart';

import '../../../blocs/Authentication/authentication_bloc.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    super.key,
  });
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is RegisterSuccessful) {
            context.pop();
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Flexible(
                child: GenericTextFormField(
                  labelText: "Username",
                  textEditingController: userController,
                  validatorFunction: validatorUsername,
                ),
              ),
              const Divider(),
              Flexible(
                child: GenericTextFormField(
                  labelText: "Passwords",
                  textEditingController: passController,
                  isPasswordInput: true,
                  validatorFunction: validatorPassword,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  child: const Text("Validar..."),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthenticationBloc>(context).add(
                        RegisterStarted(
                          email: userController.text.trim(),
                          password: passController.text.trim(),
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "LLene los valores de forma correcta",
                          timeInSecForIosWeb: 4,
                          textColor: Colors.white);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'contraseña no puede estar vacia';
    }
    if (value.length < 6) {
      return 'contraseña no puede tener menos de 6 caracteres';
    }
    return null;
  }

  String? validatorUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email no puede estar vacio';
    }
    if (!EmailValidator.validate(value)) {
      return 'Email no es valido';
    }
    return null;
  }
}
