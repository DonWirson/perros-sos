part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginInProgresss extends AuthenticationState {}

final class LoginSuccessful extends AuthenticationState {}

final class LoginFailure extends AuthenticationState {}

final class RegisterInProgress extends AuthenticationState {}

final class RegisterSuccessfull extends AuthenticationState {}

final class RegisterFailure extends AuthenticationState {
  final String errorMessage;

  const RegisterFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
