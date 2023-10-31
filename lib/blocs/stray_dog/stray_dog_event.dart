part of 'stray_dog_bloc.dart';

sealed class StrayDogEvent extends Equatable {
  const StrayDogEvent();

  @override
  List<Object> get props => [];
}

final class GotAllStrayDogs extends StrayDogEvent {}
