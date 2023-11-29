import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_preferences_event.dart';
part 'user_preferences_state.dart';

class UserPreferencesBloc
    extends Bloc<UserPreferencesEvent, UserPreferencesState> {
  int currentIndex = 0;
  UserPreferencesBloc() : super(UserPreferencesInitial()) {
    on<UserPreferencesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
