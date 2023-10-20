import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/Authentication/authentication_bloc.dart';
import '../../utils/form_validators/login_register_validators.dart';
import '../../utils/text_form_field_generic.dart';

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
                  validatorFunction: LoginRegisterValidators.emailValidator,
                ),
              ),
              const Divider(),
              Flexible(
                child: GenericTextFormField(
                  labelText: "Passwords",
                  textEditingController: passController,
                  isPasswordInput: true,
                  validatorFunction: LoginRegisterValidators.passwordValidator,
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
}
