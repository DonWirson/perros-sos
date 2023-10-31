import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

import 'blocs/Authentication/authentication_bloc.dart';
import 'blocs/observer/bloc_observer.dart';
import 'blocs/stray_dog/stray_dog_bloc.dart';
import 'core/utils/routes.dart';
import 'firebase_options.dart';

Future main() async {
  //Bloc observer
  Bloc.observer = AppBlocObserver();
  //Config de diccionario
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //Confi de GoRouter
  GoRouter.optionURLReflectsImperativeAPIs = true;
  //Config de firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Carga de archivo .env
  await dotenv.load(fileName: ".env");
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'CL')],
      path: 'assets/localization',
      fallbackLocale: const Locale('es', 'CL'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => StrayDogBloc(),
        ),
      ],
      child: MaterialApp.router(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.grey.shade100),
        routerConfig: Routes.getroutes,
      ),
    );
  }
}
