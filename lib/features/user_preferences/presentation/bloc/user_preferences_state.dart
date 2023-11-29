part of 'user_preferences_bloc.dart';

abstract class UserPreferencesState extends Equatable {
  const UserPreferencesState();  

  @override
  List<Object> get props => [];
}
class UserPreferencesInitial extends UserPreferencesState {}
