import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late User? userStatus;
  late Stream<User?> userStream;
  AuthenticationBloc() : super(AuthenticationInitial()) {
    //Usado para redirigir a landing o pagina de login, tambien en caso de cerrar sesion remotamente.
    // FirebaseAuth.instance.authStateChanges().listen((user) {
    //   userStatus = user;
    // });
    userStream = FirebaseAuth.instance.authStateChanges();

    on<AuthenticationEvent>((event, emit) {});
    on<CheckedLoggedIn>(_checkedLoged);
    on<LoginStarted>(_loginStarted);
    on<RegisterStarted>(_registerStarted);
  }

  Future<void> _checkedLoged(
      CheckedLoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(LoginInProgress());
    try {
      final user = FirebaseAuth.instance.currentUser;

      emit(LoginSuccessful());
    } catch (e) {
      emit(LoginFailure());
    }
  }

  Future<void> _loginStarted(
      LoginStarted event, Emitter<AuthenticationState> emit) async {
    emit(LoginInProgress());
    try {
      // FirebaseAuth.instance.signInWithCredential(response);
      emit(LoginSuccessful());
    } catch (e) {
      emit(LoginFailure());
    }
  }

  Future<void> _registerStarted(
      RegisterStarted event, Emitter<AuthenticationState> emit) async {
    try {
      emit(RegisterInProgress());
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "twilliamson.valdes@gmail.com", password: "atata123");
      emit(RegisterSuccessful());
    } catch (e) {
      emit(
        RegisterFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
