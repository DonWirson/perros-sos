import 'package:flutter/material.dart';
import 'package:perros_sos/core/utils/generic_scaffold.dart';
import 'package:perros_sos/core/widgets/register_form%202.dart';
import 'package:perros_sos/core/widgets/register_form.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      showBottomBar: false,
      bodyWidget: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RegisterForm(
          formKey: _formKey,
        ),
      ),
    );
  }
}
