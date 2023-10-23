import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/utils/generic_scaffold.dart';
import '../../core/widgets/landing/stray_dogs_carrousel.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GenericScaffold(
        showBottomBar: true,
        title: "Inicio",
        bodyWidget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: !FirebaseAuth.instance.currentUser!.isAnonymous
              //       ? Text("Hola ${FirebaseAuth.instance.currentUser?.email}")
              //       : const Text("Bienvenido usuario anonimo"),
              // ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child:
                    Center(child: Text("Perros callejeros resportados hoy:")),
              ),
              const StrayDogsCarrousel(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  child: const Text("Cerrar sesion"),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
