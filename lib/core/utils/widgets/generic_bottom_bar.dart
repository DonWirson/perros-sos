import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/routes/routes.dart';
import '../../../features/user_preferences/presentation/bloc/user_preferences_bloc.dart';

class GenericBottomBar extends StatefulWidget {
  const GenericBottomBar({
    super.key,
  });

  @override
  State<GenericBottomBar> createState() => _GenericBottomBarState();
}

class _GenericBottomBarState extends State<GenericBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: Routes.bottomBarItems,
      currentIndex: BlocProvider.of<UserPreferencesBloc>(context).currentIndex,
      selectedItemColor: const Color.fromARGB(158, 255, 145, 0),
      onTap: (currentIndex) => BlocProvider.of<UserPreferencesBloc>(context)
          .currentIndex = currentIndex,
    );
  }
}
