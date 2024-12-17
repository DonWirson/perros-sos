import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extension/font_extension.dart';
import '../../../../../core/utils/loading_progress_indicator.dart';
import '../../../../../core/utils/widgets/generic_text_form_field.dart';
import '../../../../../core/validators/login_validators.dart';
import '../../bloc/authentication_bloc.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is RegisterSuccessful) {
            successfullRegister(context);
          }
        },
        builder: (context, state) {
          if (state is RegisterInProgress || state is RegisterSuccessful) {
            return const LoadingProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Text(
                    "Perdidog_placeholder",
                    style: Theme.of(context).textTheme.title1,
                  ),
                  GenericTextFormField(
                    labelText: "register_form_email",
                    textEditingController: userController,
                    validatorFunction: LoginValidators.emailValidator,
                  ),
                  GenericTextFormField(
                    labelText: "register_form_password",
                    textEditingController: passController,
                    isPasswordInput: true,
                    validatorFunction: LoginValidators.passwordValidator,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      child: Text(
                        "register_form_validate",
                        style: Theme.of(context).textTheme.labelText,
                      ).tr(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            RegisterStarted(
                              email: userController.text.trim(),
                              password: passController.text.trim(),
                              roles: const ["Guest"],
                            ),
                          );
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
          );
        },
      ),
    );
  }

  void successfullRegister(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Cuenta creada con exito",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.green.shade300,
      ),
    );
    //Returns to login page
    context.pop();
  }
}
