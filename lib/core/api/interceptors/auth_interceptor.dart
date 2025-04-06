import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add auth token if available
    // TODO: Implement token management
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = 'An unexpected error occurred';

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage =
            'Connection timeout. Please check your internet connection.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request timeout. Please try again.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Response timeout. Please try again.';
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            errorMessage = 'Bad request. Please check your input.';
            break;
          case 401:
            errorMessage = 'Unauthorized. Please login again.';
            break;
          case 403:
            errorMessage = 'Access forbidden. You don\'t have permission.';
            break;
          case 404:
            errorMessage = 'Resource not found.';
            break;
          case 500:
            errorMessage = 'Server error. Please try again later.';
            break;
          default:
            errorMessage = err.response?.data['message'] ?? 'An error occurred';
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request cancelled.';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'No internet connection. Please check your network.';
        break;
      default:
        errorMessage = 'An unexpected error occurred';
    }

    final newError = DioException(
      requestOptions: err.requestOptions,
      error: errorMessage,
      response: err.response,
      type: err.type,
    );

    handler.next(newError);
  }
}
