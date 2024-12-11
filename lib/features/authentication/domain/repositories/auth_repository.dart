import 'package:dartz/dartz.dart';

import '../../../../core/data_state/data_state.dart';
import '../../../../core/data_state/failure.dart';
import '../usecases/register_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, ApiResponse<bool>>> registerUser(
      RegisterUserUseCaseParams useCaseParams);
}
