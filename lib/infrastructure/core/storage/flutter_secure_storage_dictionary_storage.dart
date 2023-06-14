import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'dictionary_storage.dart';

@LazySingleton(as: DictionaryStorage, env: [Environment.prod, Environment.dev])
class FlutterSecureStorageDictionaryStorage implements DictionaryStorage {
  final FlutterSecureStorage storage;

  FlutterSecureStorageDictionaryStorage(this.storage);

  @override
  Future<String?> read({required String key}) => storage.read(key: key);

  @override
  Future<void> write({required String key, required String? value}) {
    return storage.write(key: key, value: value);
  }
}
