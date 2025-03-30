// lib/app/di/di.dart
import 'package:cineverse/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> setUpDependencyInjection() async => getIt.init();
