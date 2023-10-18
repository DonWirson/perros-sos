import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<LoginStarted>(_loginStarted);
    on<RegisterStarted>(_registerStarted);
  }

  Future<void> _loginStarted(
      LoginStarted event, Emitter<AuthenticationState> emit) async {
    emit(LoginInProgress());
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
      // final response = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(
      //         email: "twilliamson.valdes@gmail.com", password: "atata123");
      // FirebaseAuth.instance.signInWithCredential(credential)
      emit(RegisterSuccessful());
    } catch (e) {
      emit(
        RegisterFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
