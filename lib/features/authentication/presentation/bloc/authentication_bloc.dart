import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/api_client_interface.dart';
import '../../../../injection_container.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
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
  }

  Future<void> _registerStarted(
      RegisterStarted event, Emitter<AuthenticationState> emit) async {
    emit(RegisterInProgress());

    await Future.delayed(
      const Duration(seconds: 1),
    );

    final apiResponse = await _registerUserUseCase(
      params: RegisterRequestDto(
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
      params: LoginRequestDto(
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

  Future<void> _checkedLoggedIn(
      CheckedLoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(
      CheckedLoggedInProgress(),
    );

    await Future.delayed(
      const Duration(seconds: 1),
    );

    final localToken = await sl<ApiClient>().getLocalToken();
    if (localToken == null) {
      //Usuario no esta logeado >:D
      emit(
        IsNotLoggedIn(),
      );
      //Usuario esta Logeado
    } else {
      emit(
        IsLoggedIn(),
      );
    }
  }
}
