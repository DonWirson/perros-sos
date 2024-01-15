import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterBackground extends StatelessWidget {
  const RegisterBackground({required this.stackBody, super.key});
  final Widget stackBody;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
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
            "register_title",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 30),
          ).tr(),
        ),
        //Agrego botón de back manualmente, asi evito agregar appbar
        if (context.canPop())
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: const Icon(Icons.navigate_before),
                onTap: () {
                  context.pop();
                },
              ),
            ),
          ),
        stackBody
      ],
    );
  }
}
