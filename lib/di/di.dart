// lib/app/di/di.dart
import 'package:cineverse/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:cineverse/core/api/dio_client.dart';

final getIt = GetIt.instance;

@InjectableInit()
@InjectableInit()
Future<void> setUpDependencyInjection() async {
  // Initialize the dependency injection
  getIt.init();

  // Register Dio instance that depends on DioClient
  getIt.registerLazySingleton<Dio>(() => getIt<DioClient>().dio);
}
