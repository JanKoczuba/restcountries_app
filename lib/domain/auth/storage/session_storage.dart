abstract class SessionStorage {
  Future<bool> getSessions();

  Future<void> storeSession();
}
