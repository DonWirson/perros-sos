import 'package:easy_localization/easy_localization.dart';
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
