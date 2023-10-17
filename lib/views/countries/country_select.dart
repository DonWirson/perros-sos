import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/generic_scaffold.dart';

class CountrySelect extends StatelessWidget {
  const CountrySelect({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToLoginScreen() => context.goNamed('login');

    return GenericScaffold(
      title: "Seleccione su país",
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
              onPressed: navigateToLoginScreen,
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
