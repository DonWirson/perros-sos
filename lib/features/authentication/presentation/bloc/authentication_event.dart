part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class CheckedLoggedIn extends AuthenticationEvent {}

//En caso de no ocupar algun valor, dejar con valor dummy
final class LoginStarted extends AuthenticationEvent {
  final String email;
  final String password;
  final String token;
  final AuthenticationEnum authType;
  const LoginStarted(
      {required this.email,
      required this.password,
      required this.token,
      required this.authType});
  @override
  List<Object> get props => [email, password, token, authType];
}

final class RegisterStarted extends AuthenticationEvent {
  final String email;
  final String password;

  const RegisterStarted({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

final class ClosedSession extends AuthenticationEvent {}

final class OpenedSession extends AuthenticationEvent {}
