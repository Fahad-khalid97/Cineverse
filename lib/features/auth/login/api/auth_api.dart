import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';
import 'package:cineverse/features/auth/login/model/session_model.dart';

import '../model/auth_resp.dart';
import '../model/session_delete_model.dart';

part 'auth_api.g.dart';

@injectable
@RestApi()
abstract class AuthAPI {
  @factoryMethod
  factory AuthAPI(Dio dio) = _AuthAPI;

  @GET(ApiConstants.authTokenNew)
  Future<AuthResponse> createRequestToken();

  @POST(ApiConstants.authValidateWithLogin)
  Future<AuthResponse> validateWithLogin({
    @Body() required Map<String, dynamic> credentials,
  });

  @POST(ApiConstants.authCreateSession)
  Future<SessionModel> createSession({
    @Body() required Map<String, dynamic> requestToken,
  });

  @DELETE(ApiConstants.authDeleteSession)
  Future<DeleteSessionResponse> deleteSession(
    @Query('api_key') String apiKey, // API key as query parameter
    @Body() Map<String, dynamic> body, // body data
  );
}
