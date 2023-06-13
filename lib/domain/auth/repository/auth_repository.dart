import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entity/user_credentials.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(UserCredentials userCredentials);
}
