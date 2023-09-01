part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class LoginStarted extends AuthenticationEvent {}

final class RegisterStarted extends AuthenticationEvent {}
