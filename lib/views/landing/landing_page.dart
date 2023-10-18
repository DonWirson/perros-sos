import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/utils/generic_scaffold.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      title: "Inicio",
      bodyWidget: Column(
        children: [
          Center(
            child: !FirebaseAuth.instance.currentUser!.isAnonymous
                ? Text("Hola ${FirebaseAuth.instance.currentUser?.email}")
                : const Text("Bienvenido usuario anonimo"),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: const Text("Cerrar sesion"),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          )
        ],
      ),
    );
  }
}
