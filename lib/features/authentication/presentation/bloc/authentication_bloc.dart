import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/api/api_client_interface.dart';
import '../../../../injection_container.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late Stream<User?> userStream;
  late StreamSubscription<User?> userStateStreamListener;

  final RegisterUserUseCase _registerUserUseCase;
  final LoginUserUseCase _loginUserUseCase;

  AuthenticationBloc(
    this._registerUserUseCase,
    this._loginUserUseCase,
  ) : super(AuthenticationInitial()) {
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

    await Future.delayed(
      const Duration(seconds: 1),
    );

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

    final apiResponse = await _loginUserUseCase(
      params: LoginUserUseCaseParams(
        username: event.email,
        password: event.password,
      ),
    );

    apiResponse.fold(
      (l) => emit(
        LoginFailure(
          errorMessage: l.message,
        ),
      ),
      (r) {
        //Token is nedded for future endpoints
        sl<ApiClient>().setToken(r.data!.jwtToken);
        emit(
          LoginSuccessful(),
        );
      },
    );
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
}
