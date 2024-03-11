import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({required this.stackBody, super.key});
  final Widget stackBody;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [0.2, 0.5, 0.8, 0.7],
              colors: [
                Colors.blue[50]!,
                Colors.blue[100]!,
                Colors.blue[200]!,
                Colors.blue[300]!
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          child: Text(
            "login_title",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 30),
          ).tr(),
        ),
        stackBody
      ],
    );
  }
}
