import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../entity/user_credentials.dart';
import '../repository/auth_repository.dart';
import 'store_session_use_case.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;
  final StoreSessionUseCase _storeSessionUseCase;

  LoginUseCase(
    this._authRepository,
    this._storeSessionUseCase,
  );

  Future<Either<Failure, bool>> execute(UserCredentials userCredentials) async {
    final auth = await _authRepository.login(userCredentials);
    await auth.fold((l) => null, (r) => _storeSessionUseCase.execute());
    return auth;
  }
}
