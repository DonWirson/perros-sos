import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/models/stray_dog_model.dart';
import '../../domain/usecases/get_stray_dogs.dart';

part 'stray_dog_event.dart';
part 'stray_dog_state.dart';

class StrayDogBloc extends Bloc<StrayDogEvent, StrayDogState> {
  final GetStrayDogsUseCase getStrayDogsUseCase;

  StrayDogBloc(this.getStrayDogsUseCase) : super(StrayDogInitial()) {
    on<StrayDogEvent>((event, emit) {});
    on<GotAllStrayDogs>(_getAllStrayDogs);
  }

  Future<void> _getAllStrayDogs(
      GotAllStrayDogs event, Emitter<StrayDogState> emit) async {
    try {
      final dataState = await getStrayDogsUseCase();
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(
          GotAllStrayDogsSuccess(dataState.data as List<StrayDogModel>),
        );
      }
      if (dataState is DataFailed) {
        emit(
          GotAllStrayDogsFailure(dataState.error!),
        );
      }
    } on DioException catch (e) {
      emit(
        GotAllStrayDogsFailure(e),
      );
    }
  }
}
