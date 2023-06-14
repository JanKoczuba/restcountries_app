import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../storage/session_storage.dart';

@injectable
class GetSessionsUseCase {
  final SessionStorage _sessionStorage;

  GetSessionsUseCase(this._sessionStorage);

  Future<Either<Failure, bool>> execute() async {
    return right(await _sessionStorage.getSessions());
  }
}
