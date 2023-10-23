import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/enums/auth_enum.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late User? userStatus;
  late Stream<User?> userStream;
  AuthenticationBloc() : super(AuthenticationInitial()) {
    userStream = FirebaseAuth.instance.authStateChanges();
    on<AuthenticationEvent>((event, emit) {});
    on<CheckedLoggedIn>(_checkedLoged);
    on<LoginStarted>(_loginStarted);
    on<RegisterStarted>(_registerStarted);
  }
  //Actualmente sin ocupar

  Future<void> _checkedLoged(
      CheckedLoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(LoginInProgress());
    try {
      final user = FirebaseAuth.instance.currentUser;
      emit(IsLoggedIn());
    } catch (e) {
      emit(IsNotLoggedIn());
    }
  }

  Future<void> _registerStarted(
      RegisterStarted event, Emitter<AuthenticationState> emit) async {
    try {
      emit(RegisterInProgress());
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
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
        case AuthEnum.email:
          final response =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSuccessful());
          break;
        case AuthEnum.firebase:
          break;
        case AuthEnum.google:
          break;
        case AuthEnum.apple:
          break;
        default:
          emit(
            const LoginFailure(errorMessage: "FALTO PONER EL TIPO DE LOGIN"),
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
