import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/stray_dog_model.dart';
import '../../services/stray_dog/stray_dog_service.dart';

part 'stray_dog_event.dart';
part 'stray_dog_state.dart';

class StrayDogBloc extends Bloc<StrayDogEvent, StrayDogState> {
  StrayDogBloc() : super(StrayDogInitial()) {
    on<StrayDogEvent>((event, emit) {});
    on<GotAllStrayDogs>(_getAllStrayDogs);
  }

  Future<void> _getAllStrayDogs(
      GotAllStrayDogs event, Emitter<StrayDogState> emit) async {
    try {
      final response = await StrayDogService().getAllStrayDogs();
      emit(
        GotAllStrayDogSuccessful(strayDogsModel: response),
      );
    } catch (e) {
      emit(
        GotAllStrayDogFailure(),
      );
    }
  }
}
