part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class CheckedLoggedIn extends AuthenticationEvent {}

final class RegisterStarted extends AuthenticationEvent {
  final String email;
  final String password;
  final List<String> roles;

  const RegisterStarted({
    required this.email,
    required this.password,
    required this.roles,
  });

  @override
  List<Object> get props => [email, password, roles];
}

final class LoginStarted extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginStarted({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

final class ClosedSession extends AuthenticationEvent {}

final class OpenedSession extends AuthenticationEvent {}
