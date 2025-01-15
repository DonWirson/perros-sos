part of 'stray_dog_bloc.dart';

abstract class StrayDogEvent extends Equatable {
  const StrayDogEvent();

  @override
  List<Object> get props => [];
}

final class GotAllLostPets extends StrayDogEvent {}

final class CreatedStrayDogReport extends StrayDogEvent {
  final LostPet lostPet;
  const CreatedStrayDogReport({required this.lostPet});
  @override
  List<Object> get props => [];
}
