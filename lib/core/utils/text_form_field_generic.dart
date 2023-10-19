import 'package:flutter/material.dart';

class GenericTextFormField extends StatefulWidget {
  const GenericTextFormField(
      {super.key,
      required this.textEditingController,
      required this.labelText,
      required this.validatorFunction,
      this.isPasswordInput = false});

  final TextEditingController textEditingController;
  final String labelText;
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
        SizedBox(width: 100, child: Text(widget.labelText)),
        Expanded(
          flex: 4,
          child: TextFormField(
            controller: widget.textEditingController,
            obscureText: isThisInputPassword ? obscurePassword : false,
            enableSuggestions: !isThisInputPassword,
            autocorrect: !isThisInputPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validatorFunction,
          ),
        ),
        if (isThisInputPassword)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                child: obscurePassword
                    ? const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.remove_red_eye_outlined,
                      ),
                onTap: () {
                  setState(() => obscurePassword = !obscurePassword);
                },
              ),
            ),
          ),
      ],
    );
  }
}
