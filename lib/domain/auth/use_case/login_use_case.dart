import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../entity/user_credentials.dart';
import '../repository/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(
    this._authRepository,
  );

  Future<Either<Failure, bool>> execute(UserCredentials userCredentials) =>
      _authRepository.login(userCredentials);
}
