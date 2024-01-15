import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/widgets/register_background.dart';

import '../../../../../core/utils/widgets/generic_scaffold.dart';
import '../../bloc/authentication_bloc.dart';
import '../../bloc/widgets/register_form.dart';

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
      bodyWidget: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is RegisterSuccessful) {
              // Fluttertoast.showToast(
              //     msg: "REGISTRO EXITOSO!,REDIRIGIENDO", timeInSecForIosWeb: 2);
            }
          },
          child: RegisterBackground(
            stackBody: RegisterForm(),
          )),
    );
  }
}
