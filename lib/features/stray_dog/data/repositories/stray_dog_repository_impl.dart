import '../../../../core/data_state/data_state.dart';
import '../../domain/entities/lost_pet.dart';
import '../../domain/repositories/stray_dog_repository.dart';
import '../datasources/remote/stray_dog_api_service.dart';

class StrayDogRepositoryImpl implements StrayDogRepository {
  final StrayDogApiService _strayDogService;

  StrayDogRepositoryImpl(this._strayDogService);

  @override
  Future<ApiResponse<List<LostPet>>> getAllStrayDogs() async {
    final apiResponse = await _strayDogService.getAllStrayDogs();
    return apiResponse;
  }

  @override
  Future<ApiResponse<LostPet>> getOneStrayDog({required int id}) {
    // TODO: implement getOneStrayDog
    throw UnimplementedError();
  }
}
