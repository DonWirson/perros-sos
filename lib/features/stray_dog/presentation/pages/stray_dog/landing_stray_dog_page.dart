import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/stray_dog_model.dart';
import '../../bloc/stray_dog_bloc.dart';
import '../../widgets/stray_dog_carrouse.dart';

class LandingStrayDog extends StatelessWidget {
  const LandingStrayDog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StrayDogsCarrousel(),
          const Text("TESTING"),
          ElevatedButton(
            child: const Text("Test crear reporte"),
            onPressed: () {
              BlocProvider.of<StrayDogBloc>(context).add(
                const CreatedStrayDogReport(strayDogModel: StrayDogModel()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: const Text("landing_sign_out").tr(),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          ),
        ],
      ),
    );
  }
}
