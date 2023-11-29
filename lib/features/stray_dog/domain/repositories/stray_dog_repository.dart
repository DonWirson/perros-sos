import '../../../../core/resources/data_state.dart';
import '../entities/stray_dog.dart';

abstract class StrayDogRepository {
  Future<DataState<List<StrayDogEntity>>> getAllStrayDogs();
  Future<DataState<StrayDogEntity>> getOneStrayDog({required String endPoint});
}
