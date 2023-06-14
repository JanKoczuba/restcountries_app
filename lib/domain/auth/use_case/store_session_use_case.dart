import 'package:injectable/injectable.dart';

import '../storage/session_storage.dart';

@injectable
class StoreSessionUseCase {
  final SessionStorage _sessionStorage;

  StoreSessionUseCase(
    this._sessionStorage,
  );

  Future<void> execute() => _sessionStorage.storeSession();
}
