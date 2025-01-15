import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/lost_pet.dart';
import '../../domain/usecases/get_stray_dogs.dart';

part 'stray_dog_event.dart';
part 'stray_dog_state.dart';

class StrayDogBloc extends Bloc<StrayDogEvent, StrayDogState> {
  final GetLostPetsUseCase getLostPetsUseCase;

  StrayDogBloc(this.getLostPetsUseCase) : super(StrayDogInitial()) {
    on<StrayDogEvent>((event, emit) {});
    on<GotAllLostPets>(_getAllStrayDogs);
  }

  Future<void> _getAllStrayDogs(
      GotAllLostPets event, Emitter<StrayDogState> emit) async {
    try {
      emit(
        GotAllLostPetsInProgress(),
      );

      final apiResponse = await getLostPetsUseCase();
      if (apiResponse.success) {
        emit(
          GotAllLostPetsSuccess(strayDogs: apiResponse.data!),
        );
      } else {}
      // if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      //   emit(
      //     GotAllLostPetsSuccess(dataState.data as List<LostPet>),
      //   );
      // }
    } on DioException catch (e) {
      // emit(
      //   GotAllLostPetsFailure(e),
      // );
    }
  }
}
