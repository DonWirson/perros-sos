import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///Generic FormField, requires for label to be in dictionary(es-cl/en-us)
class GenericTextFormField extends StatefulWidget {
  const GenericTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.validatorFunction,
    this.hintText,
    this.isPasswordInput = false,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String? hintText;
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
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.textEditingController,
            obscureText: obscurePassword,
            enableSuggestions: !isThisInputPassword,
            autocorrect: !isThisInputPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validatorFunction,
            decoration: InputDecoration(
              labelText: widget.labelText.tr(),
              hintText: widget.hintText?.tr(),
              suffixIcon: isThisInputPassword
                  ? InkWell(
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: obscurePassword ? Colors.black38 : null,
                      ),
                      onTap: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
