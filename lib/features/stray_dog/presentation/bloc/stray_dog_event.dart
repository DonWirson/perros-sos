part of 'stray_dog_bloc.dart';

abstract class StrayDogEvent extends Equatable {
  const StrayDogEvent();

  @override
  List<Object> get props => [];
}

final class GotAllStrayDogs extends StrayDogEvent {}

final class CreatedStrayDogReport extends StrayDogEvent {
  final StrayDogEntity strayDogModel;
  const CreatedStrayDogReport({required this.strayDogModel});
  @override
  List<Object> get props => [];
}
