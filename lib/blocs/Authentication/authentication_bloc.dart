import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      //TODO:Pendiente implementar lógica de eventos, al tener backend
      on<LoginStarted>(_loginStarted);
      on<RegisterStarted>(_registerStarted);
    });
  }

  Future<void> _loginStarted(
      LoginStarted event, Emitter<AuthenticationState> emit) async {
    emit(LoginInProgresss());
    try {
      emit(LoginSuccessful());
    } catch (e) {
      emit(LoginFailure());
    }
  }

  Future<void> _registerStarted(
      RegisterStarted event, Emitter<AuthenticationState> emit) async {
    emit(RegisterInProgress());
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );
      await googleSignIn.signIn();
    } catch (e) {
      log("Sign in failed :C");
    }
  }
}
