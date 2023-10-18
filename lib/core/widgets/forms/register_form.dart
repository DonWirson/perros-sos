import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../blocs/Authentication/authentication_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 100, child: Text("Email")),
                Expanded(
                  child: TextFormField(
                    controller: userController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email no puede estar vacio';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Email no es valido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const SizedBox(width: 100, child: Text("Password")),
                Expanded(
                  child: TextFormField(
                    controller: passController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'contraseña no puede estar vacia';
                      }
                      if (value.length < 6) {
                        return 'contraseña no puede tener menos de 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
              ],
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
    );
  }
}
