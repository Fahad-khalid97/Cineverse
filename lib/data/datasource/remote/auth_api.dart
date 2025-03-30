import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';
import 'package:cineverse/data/models/auth/session_model.dart';

import '../../models/auth/auth_resp.dart';
import '../../models/auth/session_delete_model.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dio, {String? baseUrl}) = _AuthAPI;

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
  Future<DeleteSessionResponse> deleteSession({
    @Body() required Map<String, dynamic> sessionId,
  });
}
