import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  factory SecureStorageService() => _instance;
  SecureStorageService._internal();

  final _secureStorage = const FlutterSecureStorage();

  static const sessionId = 'sessionId';

  Future<void> saveSessionId(String id) async {
    await _secureStorage.write(key: sessionId, value: id);
  }

  Future<String?> getSessionId() async {
    return await _secureStorage.read(key: sessionId);
  }

  Future<void> deleteSessionId() async {
    await _secureStorage.delete(key: sessionId);
  }

  Future<void> clearStorage() async {
    await _secureStorage.deleteAll();
  }
}
