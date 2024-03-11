import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/loading_progress_indicator.dart';
import '../../../../../core/utils/widgets/generic_app_bar.dart';
import '../../../../../core/utils/widgets/generic_scaffold.dart';
import '../../../../authentication/presentation/bloc/authentication_bloc.dart';
import '../../../../user_preferences/presentation/bloc/user_preferences_bloc.dart';
import '../settings/landing_settings_page.dart';
import '../stray_dog/landing_stray_dog_page.dart';

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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cerrando sesión'),
              duration: Duration(seconds: 2),
            ),
          );
          context.pushReplacementNamed("login");
        }
        if (state is IsLoggedIn) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Esta actualmente logeado :D, landing'),
              duration: Duration(seconds: 10),
            ),
          );
        }
      },
      builder: (context, state) {
        var padding = 20.0;
        if (state is LoginInProgress || state is IsNotLoggedIn) {
          return const LoadingProgressIndicator();
        }
        return GenericScaffold(
          title: "Perdidog",
          showAppBar: true,
          showBottomBar: true,
          bodyWidget: Container(
            padding: EdgeInsets.only(left: padding, right: padding),
            height: MediaQuery.of(context).size.height - padding,
            width: MediaQuery.of(context).size.width - padding,
            color: Colors.white,
            child: IndexedStack(
              index: BlocProvider.of<UserPreferencesBloc>(context).currentIndex,
              children: const [
                //Primera Vista
                LandingStrayDog(),
                //Segunda Vista
                LandingPage(),
                //Tercera vista
                Landingsettings(),
              ],
            ),
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
