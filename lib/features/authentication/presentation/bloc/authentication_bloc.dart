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
  AuthenticationBloc() : super(AuthenticationInitial()) {
    log("-----------Authentication listener-----------");
    userStateStreamListener =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //Dispara evento que cierra o inicia sesión
      if (user == null) {
        add(
          ClosedSession(),
        );
      } else {
        add(
          OpenedSession(),
        );
      }
    });
    on<AuthenticationEvent>((event, emit) {});
    on<CheckedLoggedIn>(_checkedLoggedIn);
    on<OpenedSession>(_openedSession);
    on<ClosedSession>(_closedSession);
  }

  Future<void> _openedSession(
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
      emit(
        IsLoggedIn(),
      );
    }
  }

  Future<void> _closedSession(
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
      emit(
        IsNotLoggedIn(),
      );
    }
  }

  Future<void> _checkedLoggedIn(
      CheckedLoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(
      LoginInProgress(),
    );
    await Future.delayed(
      const Duration(seconds: 2),
    );
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        //Dispara evento que cierra sesión
        add(
          ClosedSession(),
        );
      } else {
        add(
          OpenedSession(),
        );
      }
    } catch (e) {
      emit(
        IsNotLoggedIn(),
      );
    }
  }

  Future<void> _registerStarted(
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

  Future<void> _loginStarted(
      LoginStarted event, Emitter<AuthenticationState> emit) async {
    emit(LoginInProgress());
    try {
      switch (event.authType) {
        case AuthenticationEnum.email:
          final response =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          //TODO: agregar validaciones
          emit(LoginSuccessful());
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
      //Hacer un Handler de códigos de error
      emit(
        LoginFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
