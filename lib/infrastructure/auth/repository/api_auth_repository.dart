import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/entity/user_credentials.dart';
import '../../../domain/auth/repository/auth_repository.dart';
import '../../../domain/core/failure.dart';
import '../../core/service/base_api_service.dart';
import '../api/auth_api.dart';

@Injectable(as: AuthRepository)
class ApiAuthRepository extends BaseApiService implements AuthRepository {
  final AuthApi _api;

  ApiAuthRepository(
    this._api,
  );

  @override
  Future<Either<Failure, bool>> login(UserCredentials userCredentials) =>
      makeRequest(
        () async {
          final authResponse = await _api.login(
            userCredentials: userCredentials,
          );
          return right(
            authResponse,
          );
        },
      );
}
