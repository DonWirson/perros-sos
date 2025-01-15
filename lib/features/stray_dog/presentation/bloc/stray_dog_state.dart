part of 'stray_dog_bloc.dart';

abstract class StrayDogState extends Equatable {
  @override
  List<Object> get props => [];
}

final class StrayDogInitial extends StrayDogState {}

final class GotAllLostPetsInProgress extends StrayDogState {}

final class GotAllLostPetsSuccess extends StrayDogState {
  final List<LostPet> strayDogs;

  GotAllLostPetsSuccess({
    required this.strayDogs,
  });
  @override
  List<Object> get props => strayDogs;
}

// final class GotAllLostPetsFailure extends StrayDogState {
//   DioException error;
//   const GotAllLostPetsFailure(DioException error) : super(error: error);
// }

// final class CreatedStrayDogState extends StrayDogState {}

// final class CreatedStrayDogReportFailure extends StrayDogState {}
