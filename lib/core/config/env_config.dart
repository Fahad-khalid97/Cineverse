import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> load() async {
    await dotenv.load();
  }

  static String get apiKey => dotenv.env['TMDB_API_KEY'] ?? '';
  static String get bearerToken => dotenv.env['TMDB_BEARER_TOKEN'] ?? '';
}
