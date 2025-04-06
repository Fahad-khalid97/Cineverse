import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/api/api_constants.dart';
import 'package:cineverse/core/api/interceptors/auth_interceptor.dart';
import 'package:cineverse/core/api/interceptors/cache_interceptor.dart';

@lazySingleton
class DioClient {
  final AuthInterceptor _authInterceptor;
  final CacheInterceptor _cacheInterceptor;
  late final Dio _dio;

  Dio get dio => _dio;

  DioClient(this._authInterceptor, this._cacheInterceptor) {
    // Initialize Dio immediately in the constructor
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.bearerToken}',
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        responseBody: true,
      ),
    );

    _dio.interceptors.add(_authInterceptor);
    _dio.interceptors.add(_cacheInterceptor);
  }
}
