import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perros_sos/core/utils/custom_list_tile.dart';

import '../../core/utils/generic_scaffold.dart';

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
              Container(
                margin: const EdgeInsets.all(20),
                height: 160,
                child: ListView.separated(
                  itemCount: 5,
                  primary: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: const CustomListTile());
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
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
