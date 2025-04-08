// lib/app/di/di.dart
import 'package:cineverse/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:cineverse/core/api/dio_client.dart';
import 'package:cineverse/core/cache/cache_manager.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> setUpDependencyInjection(store) async {
  // Initialize the dependency injection
  getIt.init();

  // Register Dio instance that depends on DioClient
  getIt.registerLazySingleton<Dio>(() => getIt<DioClient>().dio);
  getIt.registerLazySingleton<CacheManager>(() => CacheManager(store));
}
