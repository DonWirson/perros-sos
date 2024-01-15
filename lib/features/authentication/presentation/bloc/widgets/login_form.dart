import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/enum/authentication_enum.dart';
import '../../../../../core/utils/widgets/generic_text_form_field.dart';
import '../authentication_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              GenericTextFormField(
                labelText: "login_username",
                hintText: "login_username_hint",
                textEditingController: userController,
                validatorFunction: emailValidator,
              ),
              GenericTextFormField(
                labelText: "login_password",
                hintText: "login_password_hint",
                textEditingController: passController,
                isPasswordInput: true,
                validatorFunction: passwordValidator,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  child: const Text("Login_form_validate").tr(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthenticationBloc>(context).add(
                        LoginStarted(
                          email: userController.text.trim(),
                          password: passController.text.trim(),
                          authType: AuthenticationEnum.email,
                          token: "",
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              const Text("Login_form_login_validate_failure")
                                  .tr(),
                        ),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ElevatedButton(
                  onPressed: () => context.pushNamed("register"),
                  child: const Text("missing_account").tr(),
                ),
              ),
              TextButton(
                onPressed: () => FirebaseAuth.instance.signInAnonymously(),
                child: Text(
                  "anonymus_login",
                  style: Theme.of(context).textTheme.labelMedium,
                ).tr(),
              )
            ],
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
