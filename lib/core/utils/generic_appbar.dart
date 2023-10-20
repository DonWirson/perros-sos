import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GenericAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  const GenericAppBar({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    void navigateToSettings() => context.goNamed("settings");
    return AppBar(
      title: title != null ? Text("$title") : null,
      //muestra backbutton en caso de ser posible hacer pop
      leading: context.canPop()
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => context.pop(),
            )
          : null,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: navigateToSettings,
        ),
      ],
      elevation: 2.0,
    );
  }
}
