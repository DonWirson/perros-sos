import '../../../../core/resources/data_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/stray_dog.dart';
import '../repositories/stray_dog_repository.dart';

class GetStrayDogsUseCase
    implements UseCase<DataState<List<StrayDogEntity>>, void> {
  final StrayDogRepository strayDogRepository;

  GetStrayDogsUseCase(this.strayDogRepository);

  @override
  Future<DataState<List<StrayDogEntity>>> call({void params}) {
    return strayDogRepository.getAllStrayDogs();
  }
}
