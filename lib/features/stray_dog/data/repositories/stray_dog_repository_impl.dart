import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/stray_dog_repository.dart';
import '../datasources/remote/stray_dog_api_service.dart';
import '../models/stray_dog_model.dart';

class StrayDogRepositoryImplementation implements StrayDogRepository {
  final StrayDogApiService _strayDogApiService;

  StrayDogRepositoryImplementation(this._strayDogApiService);
  @override
  Future<DataState<List<StrayDogModel>>> getAllStrayDogs() async {
    try {
      final httpResponse = await _strayDogApiService.getAllStrayDogs();
      if (httpResponse.response.statusCode != HttpStatus.ok) {
        return DataFailed(
          DioException.badResponse(
            statusCode: httpResponse.response.statusCode ?? 404,
            requestOptions: RequestOptions(),
            response: httpResponse.response,
          ),
        );
      }
      return DataSuccess<List<StrayDogModel>>(httpResponse.data);
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<StrayDogModel>> getOneStrayDog({required String endPoint}) {
    // TODO: implement getOneStrayDog
    throw UnimplementedError();
  }
}
