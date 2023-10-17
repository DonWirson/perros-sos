import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    try {
      emit(RegisterInProgress());
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "twilliamson.valdes@gmail.com", password: "atata123");
      // FirebaseAuth.instance.signInWithCredential(credential)
      emit(
        RegisterSuccessfull(),
      );
    } catch (e) {
      emit(
        RegisterFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
