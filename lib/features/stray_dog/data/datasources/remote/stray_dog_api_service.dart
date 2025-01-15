import '../../../../../core/api/api_client_interface.dart';
import '../../../../../core/data_state/data_state.dart';
import '../../../../../core/enum/method_type_enum.dart';
import '../../model/stray_dog_models.dart';

class StrayDogApiService {
  final ApiClient apiClient;

  StrayDogApiService({
    required this.apiClient,
  });

  final endpointUrl = '/lost-pet';

  Future<ApiResponse<List<LostPetModel>>> getAllStrayDogs() async {
    final response = await apiClient.request<List<LostPetModel>, List>(
        path: endpointUrl,
        method: MethodType.get,
        fromJson: (json) {
          List<LostPetModel> lostPets = [];

          json.forEach((element) {
            lostPets.add(LostPetModel.fromJson(element));
          });

          return lostPets;
        });

    return response;
  }

  // Future<ApiResponse<LostPetModel>> getOneStrayDog(int id) async {
  //   final response = await apiClient.request<LostPetModel>(
  //     path: "$endpointUrl/$id",
  //     method: MethodType.get,
  //     fromJson: (json) => LostPetModel.fromMap(json),
  //   );
  //   return response;
  // }
}
