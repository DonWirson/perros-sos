import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:perros_sos/core/utils/text_form_field_generic.dart';

import '../../../blocs/Authentication/authentication_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            GenericTextFormField(
                textEditingController: userController,
                labelText: "email",
                validatorFunction: validatorFunction),

            ////
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
    );
  }
}
