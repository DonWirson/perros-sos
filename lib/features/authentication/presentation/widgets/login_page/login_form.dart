import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/widgets/generic_text_form_field.dart';
import '../../../../../../core/validators/login_validators.dart';
import '../../bloc/authentication_bloc.dart';

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
              validatorFunction: LoginValidators.emailValidator,
            ),
            GenericTextFormField(
              labelText: "login_password",
              hintText: "login_password_hint",
              textEditingController: passController,
              isPasswordInput: true,
              validatorFunction: LoginValidators.passwordValidator,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                child: const Text("Login_form_validate").tr(),
                onPressed: () => onLoginPressed(context),
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
              onPressed: () => print("atataaaa anonimus"),
              child: Text(
                "anonymus_login",
                style: Theme.of(context).textTheme.labelMedium,
              ).tr(),
            )
          ],
        ),
      ),
    );
  }

  Future<void> onLoginPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthenticationBloc>(context).add(
        LoginStarted(
          email: userController.text.trim(),
          password: passController.text.trim(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Login_form_login_validate_failure").tr(),
        ),
      );
    }
  }
}
