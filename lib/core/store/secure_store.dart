// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SecureStore {
//   final storage = const FlutterSecureStorage();

//   Future<void> writeSecureData(String key, String value) async {
//     await storage.write(key: key, value: value);
//   }

//   Future<String> readSecureData(String key) async {
//     return await storage.read(key: key) ?? '';
//   }

//   Future<String> getSessionId() async {
//     return await readSecureData('session_id');
//   }

//   Future<void> setSessionId(String sessionId) async {
//     await writeSecureData('session_id', sessionId);
//   }

//   Future<void> deleteSessionId() async {
//     await storage.delete(key: 'session_id');
//   }
// }
