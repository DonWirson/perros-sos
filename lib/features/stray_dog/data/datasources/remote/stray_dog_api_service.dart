import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:perros_sos/features/stray_dog/data/models/stray_dog_model.dart';

part 'stray_dog_api_service.g.dart';

@RestApi(baseUrl: "192.168.100.151/stray-dogs/")
abstract class StrayDogApiService {
  factory StrayDogApiService(Dio dio, {String baseUrl}) = _StrayDogApiService;

  @GET('')
  Future<HttpResponse<List<StrayDogModel>>> getAllStrayDogs();

  @GET("/{uuid}")
  Future<HttpResponse<StrayDogModel>> getOneStrayDog(@Path() String uuid);
}
