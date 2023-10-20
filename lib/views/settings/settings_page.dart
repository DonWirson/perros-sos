import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/utils/generic_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      bodyWidget: Center(
        child: const Text("settings").tr(),
      ),
    );
  }
}
