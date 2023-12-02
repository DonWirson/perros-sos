import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/enum/authentication_enum.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late Stream<User?> userStream;
  late StreamSubscription<User?> userStateStreamListener;
  //Declara listener de stream en body de constructor de bloc
  AuthenticationBloc() : super(AuthenticationInitial()) {
    log("-----------Authentication listener started-----------");
    userStateStreamListener =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log("-----------Not Logged in Listener logger-----------");
        add(ClosedSession());
      } else {
        log("-----------Logged in Listener logger-----------");
        add(OpenedSession());
      }
    });
    //Eventos de bloc actuales
    on<AuthenticationEvent>((event, emit) {});
    on<LoggedInAnonymously>(logInAnonymously);
    on<OpenedSession>(openedSession);
    on<ClosedSession>(closedSession);
    on<LoggedOut>(loggedOut);
  }

  Future<void> closedSession(
      ClosedSession event, Emitter<AuthenticationState> emit) async {
    try {
      emit(
        LoginInProgress(),
      );
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(
        IsNotLoggedIn(),
      );
    } catch (e) {
      log(
        e.toString(),
      );
      //Emite state de usuario logeado, para que reintente cerrar sesión
      // emit(IsLoggedIn());
    }
  }

  Future<void> openedSession(
      OpenedSession event, Emitter<AuthenticationState> emit) async {
    try {
      emit(
        LoginInProgress(),
      );
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(
        IsLoggedIn(),
      );
    } catch (e) {
      log(
        e.toString(),
      );
      //Emite state de usuario sin iniciar sesión, para que reintente iniciar sesión
      // emit(IsNotLoggedIn());
    }
  }

  Future<void> logInAnonymously(
      LoggedInAnonymously event, Emitter<AuthenticationState> emit) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      emit(
        AnonymousLoginFailure(
          error: e.toString(),
        ),
      );
      log(e.toString());
    }
  }

  Future<void> loggedOut(
      LoggedOut event, Emitter<AuthenticationState> emit) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      emit(
        LogOutFailure(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> registerStarted(
      RegisterStarted event, Emitter<AuthenticationState> emit) async {
    try {
      emit(RegisterInProgress());
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      //TODO: Agregar validaciones
      emit(RegisterSuccessful());
    } catch (e) {
      emit(
        RegisterFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loginStarted(
      LoginStarted event, Emitter<AuthenticationState> emit) async {
    emit(LoginInProgress());
    try {
      switch (event.authType) {
        case AuthenticationEnum.email:
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          break;
        case AuthenticationEnum.firebase:
          break;
        case AuthenticationEnum.google:
          break;
        case AuthenticationEnum.apple:
          break;
        default:
          emit(
            const LoginFailure(
                errorMessage: "FALTO PONER EL TIPO DE LOGIN :/ "),
          );
          break;
      }
    } catch (e) {
      //TODO: Hacer un Handler de códigos de error
      emit(
        LoginFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
