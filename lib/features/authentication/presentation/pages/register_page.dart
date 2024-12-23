import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/gradients/gradients.dart';
import '../../../../core/utils/widgets/generic_scaffold.dart';
import '../widgets/register_page/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      showAppBar: false,
      showBottomBar: false,
      title: "register_page".tr(),
      bodyWidget: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Gradients.registerGradient(),
        ),
        child: RegisterForm(),
      ),
    );
  }
}
