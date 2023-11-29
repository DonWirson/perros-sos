part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();  

  @override
  List<Object> get props => [];
}
class AuthenticationInitial extends AuthenticationState {}

final class IsLoggedIn extends AuthenticationState {}

final class IsNotLoggedIn extends AuthenticationState {}

final class LoginInProgress extends AuthenticationState {}

final class LoginSuccessful extends AuthenticationState {}

final class LoginFailure extends AuthenticationState {
  final String errorMessage;
  const LoginFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class RegisterInProgress extends AuthenticationState {}

final class RegisterSuccessful extends AuthenticationState {}

final class RegisterFailure extends AuthenticationState {
  final String errorMessage;

  const RegisterFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}