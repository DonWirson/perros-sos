import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/usecases/register_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late Stream<User?> userStream;
  late StreamSubscription<User?> userStateStreamListener;

  final RegisterUserUseCase _registerUserUseCase;

  AuthenticationBloc(
    this._registerUserUseCase,
  ) : super(AuthenticationInitial()) {
    // log("-----------Authentication listener-----------");
    // userStateStreamListener =
    //     FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   //Dispara evento que cierra o inicia sesión
    //   if (user == null) {
    //     add(
    //       ClosedSession(),
    //     );
    //   } else {
    //     add(
    //       OpenedSession(),
    //     );
    //   }
    // });
    on<AuthenticationEvent>((event, emit) {});
    on<LoginStarted>(_loginStarted);
    on<RegisterStarted>(_registerStarted);
    on<CheckedLoggedIn>(_checkedLoggedIn);
    on<OpenedSession>(_openedSession);
    on<ClosedSession>(_closedSession);
  }

  Future<void> _registerStarted(
      RegisterStarted event, Emitter<AuthenticationState> emit) async {
    emit(RegisterInProgress());

    final apiResponse = await _registerUserUseCase(
      params: RegisterUserUseCaseParams(
        username: event.email,
        password: event.password,
        roles: event.roles,
      ),
    );

    apiResponse.fold(
      (l) => emit(
        RegisterFailure(
          errorMessage: l.message,
        ),
      ),
      (r) => emit(
        RegisterSuccessful(),
      ),
    );
  }

  Future<void> _loginStarted(
      LoginStarted event, Emitter<AuthenticationState> emit) async {
    emit(LoginInProgress());

    // final apiResponse = await _registerUserUseCase(
    //   params: RegisterUserUseCaseParams(
    //     username: event.email,
    //     password: event.password,
    //   ),
    // );

    // apiResponse.fold(
    //   (l) => emit(
    //     RegisterFailure(
    //       errorMessage: l.message,
    //     ),
    //   ),
    //   (r) => emit(
    //     RegisterSuccessful(),
    //   ),
    // );
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

  // Future<void> _registerStarted(
  //     RegisterStarted event, Emitter<AuthenticationState> emit) async {
  //   try {
  //     emit(RegisterInProgress());
  //     final response = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: event.email, password: event.password);
  //     //TODO: Agregar validaciones
  //     emit(RegisterSuccessful());
  //   } catch (e) {
  //     emit(
  //       RegisterFailure(
  //         errorMessage: e.toString(),
  //       ),
  //     );
  //   }
  // }
}
