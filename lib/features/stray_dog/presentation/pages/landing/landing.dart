import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perros_sos/core/utils/widgets/generic_scaffold.dart';
import 'package:perros_sos/features/stray_dog/data/models/stray_dog_model.dart';
import 'package:perros_sos/features/stray_dog/presentation/bloc/stray_dog_bloc.dart';
import 'package:perros_sos/features/stray_dog/presentation/widgets/stray_dog_carrouse.dart';
import 'package:perros_sos/injection_container.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GenericScaffold(
        showBottomBar: true,
        title: "landing_title".tr(),
        bodyWidget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                  child: const Text("landing_stray_dog_title").tr(),
                ),
              ),
              const StrayDogsCarrousel(),
              ElevatedButton(
                child: const Text("Test crear reporte"),
                onPressed: () {
                  sl.get<StrayDogBloc>().add(
                        const CreatedStrayDogReport(
                            strayDogModel: StrayDogModel()),
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
        ),
      ),
    );
  }
}
