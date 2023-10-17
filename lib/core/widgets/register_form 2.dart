import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterForm2 extends StatefulWidget {
  const RegisterForm2({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<RegisterForm2> createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FormBuilder(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FormBuilderTextField(
            name: "user",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Usuario no puede estar vacio';
              }
              return null;
            },
          ),
          ElevatedButton(
            child: Text("Validar..."),
            onPressed: () {
              if (!widget.formKey.currentState!.validate()) {
                Fluttertoast.showToast(msg: "Valido :D", timeInSecForIosWeb: 4);
              }
              Fluttertoast.showToast(
                  msg: "NO Valido :D",
                  timeInSecForIosWeb: 4,
                  textColor: Colors.red);
            },
          )
        ],
      ),
    );
  }
}
