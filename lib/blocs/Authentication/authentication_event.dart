part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class LoginStarted extends AuthenticationEvent {
  final String username;
  final String password;
  const LoginStarted({required this.username, required this.password});
  @override
  List<Object> get props => [username, password];
}

final class RegisterStarted extends AuthenticationEvent {
  final String username;
  final String password;

  const RegisterStarted({required this.username, required this.password});
  @override
  List<Object> get props => [username, password];
}
