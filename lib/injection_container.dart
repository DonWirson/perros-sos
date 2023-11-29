import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'config/app.config.dart';
import 'features/stray_dog/data/datasources/remote/stray_dog_api_service.dart';
import 'features/stray_dog/data/repositories/stray_dog_repository_impl.dart';
import 'features/stray_dog/domain/repositories/stray_dog_repository.dart';
import 'features/stray_dog/domain/usecases/get_stray_dogs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio instance
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<StrayDogApiService>(
    StrayDogApiService(
      sl(),
      baseUrl: AppConfig.strayDogUrl,
    ),
  );
  //Dependencies
  sl.registerSingleton<StrayDogRepository>(
    StrayDogRepositoryImplementation(
      sl(),
    ),
  );
  //Use cases
  sl.registerSingleton<GetStrayDogsUseCase>(
    GetStrayDogsUseCase(
      sl(),
    ),
  );
}
