import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/widgets/generic_text_form_field.dart';
import '../authentication_bloc.dart';

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  GenericTextFormField(
                    labelText: "register_form_password",
                    textEditingController: userController,
                    validatorFunction: emailValidator,
                  ),
                  GenericTextFormField(
                    labelText: "register_form_password",
                    textEditingController: passController,
                    isPasswordInput: true,
                    validatorFunction: passwordValidator,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      child: const Text("register_form_validate").tr(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            RegisterStarted(
                              email: userController.text.trim(),
                              password: passController.text.trim(),
                            ),
                          );
                        } else {
                          // Fluttertoast.showToast(
                          //     msg: "LLene los valores de forma correcta",
                          //     timeInSecForIosWeb: 4,
                          //     textColor: Colors.white);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contraseña no puede estar vacia';
    }
    if (value.length < 6) {
      return 'Contraseña no puede tener menos de 6 caracteres';
    }
    return null;
  }

  //TODO: Add context to parameters, then add dictionary keyword
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email no puede estar vacio';
    }
    if (!EmailValidator.validate(value)) {
      return 'Email no es valido';
    }
    return null;
  }
}
