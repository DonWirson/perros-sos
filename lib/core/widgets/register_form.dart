import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Form(
        key: widget.formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 100, child: Text("User")),
                Expanded(
                  child: TextFormField(
                    controller: userController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Usuario no puede estar vacio';
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
                        return 'Usuario no puede estar vacio';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text("Validar..."),
              onPressed: () {
                if (!widget.formKey.currentState!.validate()) {
                  Fluttertoast.showToast(
                      msg: "Valido :D", timeInSecForIosWeb: 4);
                }
                Fluttertoast.showToast(
                    msg: " NO Valido :D",
                    timeInSecForIosWeb: 4,
                    textColor: Colors.red);
              },
            )
          ],
        ),
      ),
    );
  }
}
