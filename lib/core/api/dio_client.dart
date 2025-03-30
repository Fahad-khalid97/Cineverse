import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/api/api_constants.dart';
import 'package:cineverse/core/api/interceptors/auth_interceptor.dart';
import 'package:cineverse/core/api/interceptors/cache_interceptor.dart';

@lazySingleton
class DioClient {
  final AuthInterceptor _authInterceptor;
  final CacheInterceptor _cacheInterceptor;
  late final Dio _dio; // Add a field to store the Dio instance

  // Add a getter to access the Dio instance
  Dio get dio => _dio;

  DioClient(this._authInterceptor, this._cacheInterceptor);

  void setDio() {
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
        queryParameters: {'api_key': ApiConstants.apiKey},
      ),
    );

    _dio.interceptors.add(_authInterceptor);
    _dio.interceptors.add(_cacheInterceptor);
  }
}
