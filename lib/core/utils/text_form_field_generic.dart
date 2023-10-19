import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GenericTextFormField extends StatefulWidget {
  const GenericTextFormField(
      {super.key,
      required this.textEditingController,
      required this.validatorFunction,
      this.isPasswordInput = false});

  final TextEditingController textEditingController;
  final String? Function(String?)? validatorFunction;
  final bool isPasswordInput;

  @override
  State<GenericTextFormField> createState() => _GenericTextFormFieldState();
}

class _GenericTextFormFieldState extends State<GenericTextFormField> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    bool isThisInputPassword = widget.isPasswordInput;
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: isThisInputPassword ? obscurePassword : false,
      enableSuggestions: !isThisInputPassword,
      autocorrect: !isThisInputPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validatorFunction,
    );
  }
}
