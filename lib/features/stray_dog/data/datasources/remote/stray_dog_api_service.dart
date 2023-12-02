import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/stray_dog_model.dart';

part 'stray_dog_api_service.g.dart';

@RestApi()
abstract class StrayDogApiService {
  factory StrayDogApiService(Dio dio, {String baseUrl}) = _StrayDogApiService;
  @GET('')
  Future<HttpResponse<List<StrayDogModel>>> getAllStrayDogs();

  @GET("/{uuid}")
  Future<HttpResponse<StrayDogModel>> getOneStrayDog(@Path() String uuid);
}
