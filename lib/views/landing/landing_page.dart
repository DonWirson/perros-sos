import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perros_sos/utils/generic_scaffold.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void loginScreen() => context.go('/login');

    return GenericScaffold(
      showBottomBar: false,
      bodyWidget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: const Text("landing_title").tr(),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const CountryCodePicker(
              initialSelection: "CL",
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              alignLeft: false,
            ),
          ),
          ClipOval(
            child: Image.asset(
              "images/cute_dog.jpg",
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: loginScreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: const Text("confirm").tr(),
            ),
          ),
        ],
      ),
    );
  }
}
