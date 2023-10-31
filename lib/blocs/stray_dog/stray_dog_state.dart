part of 'stray_dog_bloc.dart';

sealed class StrayDogState extends Equatable {
  const StrayDogState();

  @override
  List<Object> get props => [];
}

final class StrayDogInitial extends StrayDogState {}

final class GotAllStrayDogSuccessful extends StrayDogState {
  final List<StrayDogModel> strayDogsModel;
  const GotAllStrayDogSuccessful({required this.strayDogsModel});
  @override
  List<Object> get props => [strayDogsModel];
}

final class GotAllStrayDogFailure extends StrayDogState {}
