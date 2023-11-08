import 'package:perros_sos/core/resources/data_state.dart';
import 'package:perros_sos/core/use_case/use_case.dart';
import 'package:perros_sos/features/stray_dog/domain/entities/stray_dog.dart';
import 'package:perros_sos/features/stray_dog/domain/repositories/stray_dog_repository.dart';

class GetStrayDogsUseCase
    implements UseCase<DataState<List<StrayDogEntity>>, void> {
  final StrayDogRepository strayDogRepository;

  GetStrayDogsUseCase(this.strayDogRepository);

  @override
  Future<DataState<List<StrayDogEntity>>> call({void params}) {
    return strayDogRepository.getAllStrayDogs();
  }
}
