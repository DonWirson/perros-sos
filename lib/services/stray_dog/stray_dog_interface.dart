import '../../models/stray_dog_model.dart';

abstract class StrayDogInterface {
  Future<List<StrayDogModel>> getAllStrayDogs();
  Future<StrayDogModel> getOneStrayDog({required String endPoint});
}
