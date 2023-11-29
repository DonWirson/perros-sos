import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/generic_app_bar.dart';
import '../map/landing_map_page.dart';
import '../settings/landing_settings_page.dart';
import '../stray_dog/landing_stray_dog_page.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../user_preferences/presentation/bloc/user_preferences_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage(
      {this.title,
      this.showAppBar = true,
      this.showBottomBar = false,
      super.key});

  final String? title;
  final bool showBottomBar;
  final bool showAppBar;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? GenericAppBar(
              title: widget.title,
            )
          : null,
      body: IndexedStack(
        index: BlocProvider.of<UserPreferencesBloc>(context).currentIndex,
        children: const [
          LandingStrayDog(),
          LandingMap(),
          Landingsettings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: Routes.bottomBarItems,
        currentIndex:
            BlocProvider.of<UserPreferencesBloc>(context).currentIndex,
        selectedItemColor: const Color.fromARGB(158, 255, 145, 0),
        onTap: (currentIndex) {
          setState(
            () {
              BlocProvider.of<UserPreferencesBloc>(context).currentIndex =
                  currentIndex;
            },
          );
        },
      ),
    );
  }
}
