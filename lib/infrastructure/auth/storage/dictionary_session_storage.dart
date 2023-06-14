import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../domain/auth/storage/session_storage.dart';
import '../../core/storage/dictionary_storage.dart';

@LazySingleton(as: SessionStorage)
class DictionarySessionStorage implements SessionStorage {
  static const sessionsKey = 'firstLogin';

  final DictionaryStorage storage;

  DictionarySessionStorage(
    this.storage,
  );

  @override
  Future<bool> getSessions() async {
    final value = await storage.read(key: sessionsKey);

    if (value == null) return false;
    return true;
  }

  @override
  Future<void> storeSession() async {
    await storage.write(
      key: sessionsKey,
      value: jsonEncode(true),
    );
  }
}
