part of 'stray_dog_bloc.dart';

abstract class StrayDogState extends Equatable {
  const StrayDogState({this.strayDogs, this.error});
  final List<StrayDogModel>? strayDogs;
  final DioException? error;
  @override
  List<Object> get props => [
        strayDogs ?? [],
        error ?? DioException(requestOptions: RequestOptions())
      ];
}

final class StrayDogInitial extends StrayDogState {}

final class GotAllStrayDogsInProgress extends StrayDogState {}

final class GotAllStrayDogsSuccess extends StrayDogState {
  const GotAllStrayDogsSuccess(List<StrayDogModel> strayDogs)
      : super(strayDogs: strayDogs);
}

final class GotAllStrayDogsFailure extends StrayDogState {
  const GotAllStrayDogsFailure(DioException error) : super(error: error);
}

final class CreatedStrayDogState extends StrayDogState {}

final class CreatedStrayDogReportFailure extends StrayDogState {}
