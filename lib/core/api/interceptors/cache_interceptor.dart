import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/cache/cache_manager.dart';
import 'dart:convert';

@lazySingleton
class CacheInterceptor extends Interceptor {
  CacheInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //need to cache only GET requests
    // if (options.method != 'GET') {
    // handler.next(options);
    // }

    // final cachedData = await CacheManager().get(options.path);

    // if (cachedData != null) {
    //   final cachedResponse = Response(
    //     requestOptions: options,
    //     data: jsonDecode(cachedData.data),
    //     statusCode: 200,
    //     headers: Headers.fromMap({
    //       'cache-control': ['max-age=30'],
    //     }),
    //     statusMessage: 'OK',
    //     isRedirect: false,
    //     extra: {'cached': true, 'cachedAt': cachedData.cachedAt},
    //   );

    //   // If cache is still valid (within 30 seconds), return it
    //   if (CacheManager().isCacheValid(cachedData.cachedAt)) {
    //     return handler.resolve(cachedResponse);
    //   }

    // If cache is invalid but exists, add it to options to be used if network fails
    //options.extra['cachedResponse'] = cachedResponse;
    //  }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //need to cache only GET requests
    //if (response.requestOptions.method != 'GET') {
    // handler.next(response);
    //}

    // final cacheKey = response.requestOptions.path;
    // final cacheData = {
    //   'key': cacheKey,
    //   'data': response.data,
    //   'cachedAt': DateTime.now().toIso8601String(),
    // };

    // CacheManager().setCache(cacheKey, jsonEncode(cacheData));

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
