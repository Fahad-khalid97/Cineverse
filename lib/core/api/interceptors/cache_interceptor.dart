import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/cache/cache_manager.dart';
import 'dart:convert';

@lazySingleton
class CacheInterceptor extends Interceptor {
  final CacheManager cacheManager;
  CacheInterceptor(this.cacheManager);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Cache only GET requests
    if (options.method != 'GET') {
      super.onRequest(options, handler);
      return;
    }

    final cacheKey = await getCacheKey(options);
    final cachedEntry = cacheManager.getCacheEntry(cacheKey);

    if (cachedEntry != null) {
      final cachedResponse = Response(
        requestOptions: options,
        data: jsonDecode(cachedEntry.value)['data'],
        statusCode: 200,
        headers: Headers.fromMap({
          'cache-control': ['max-age=30'],
        }),
        statusMessage: 'OK',
        isRedirect: false,
        extra: {'cached': true, 'cachedAt': cachedEntry.cachedAt},
      );
      return handler.resolve(cachedResponse);
    }

    // If cache is not valid or doesn't exist, add it to options to be used if network fails
    options.extra['cachedData'] = cachedEntry;

    // Proceed with the request if no valid cache exists
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // Cache only GET requests with successful status codes
    if (response.requestOptions.method != 'GET' || response.statusCode != 200) {
      super.onResponse(response, handler);
      return;
    }

    final cacheKey = await getCacheKey(response.requestOptions);
    final cacheData = {
      'key': cacheKey,
      'data': response.data,
      'cachedAt': DateTime.now().toIso8601String(),
    };

    // Set the cache
    cacheManager.setCache(cacheKey, jsonEncode(cacheData));

    // Proceed with the response handling
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //if the request is not cached, return the error
    if (err.requestOptions.extra['cachedData'] == null) {
      super.onError(err, handler);
      return;
    } else {
      final cacheData = err.requestOptions.extra['cachedData'];
      handler.resolve(
        Response(
          requestOptions: err.requestOptions,
          data: cacheData['data'],
          statusCode: 200,
          statusMessage: 'OK',
          isRedirect: false,
        ),
      );
    }
  }

  Future<String> getCacheKey(RequestOptions options) async {
    final cacheKey =
        '${options.path}:${jsonEncode(options.queryParameters)}:${options.method}';
    return cacheKey;
  }
}
