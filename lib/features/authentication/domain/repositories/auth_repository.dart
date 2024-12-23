import 'package:dartz/dartz.dart';

import '../../../../core/data_state/data_state.dart';
import '../../../../core/data_state/failure.dart';
import '../entities/jwt_token.dart';
import '../usecases/login_user.dart';
import '../usecases/register_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, ApiResponse<bool>>> registerUser(
      RegisterRequestDto useCaseParams);

  Future<Either<Failure, ApiResponse<JwtToken>>> loginUser(
      LoginRequestDto useCaseParams);
}
