import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/loading_progress_indicator.dart';
import '../../../../../core/utils/widgets/generic_scaffold.dart';
import '../../../../authentication/presentation/bloc/authentication_bloc.dart';
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
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        //En caso de cerrar sesión por medio de la app o de forma externa.
        if (state is IsNotLoggedIn) {
          context.pushReplacementNamed("login");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No esta actualmente logeado :C'),
              duration: Duration(seconds: 10),
            ),
          );
        }      },
      builder: (context, state) {
        if(state is LoginInProgress){
          return const LoadingProgressIndicator();
        }
        return GenericScaffold(
          showAppBar: true,
          showBottomBar: true,
          appBarWidget: widget.showAppBar
              ? GenericAppBar(
                  title: widget.title,
                )
              : null,
          bodyWidget: IndexedStack(
            index: BlocProvider.of<UserPreferencesBloc>(context).currentIndex,
            children: const [
              LandingStrayDog(),
              LandingMap(),
              Landingsettings(),
            ],
          ),
          bottomBarWidget: BottomNavigationBar(
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
      },
    );
  }
}
