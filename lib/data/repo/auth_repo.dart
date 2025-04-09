import 'package:cineverse/features/auth/login/api/auth_api.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/login/model/auth_resp.dart';
import '../../features/auth/login/model/session_model.dart';
import '../../features/auth/login/model/session_delete_model.dart';

@injectable
class AuthRepo {
  final AuthAPI _authAPI;

  AuthRepo(this._authAPI);

  Future<AuthResponse> createRequestToken() async {
    return await _authAPI.createRequestToken();
  }

  Future<AuthResponse> validateWithLogin(
    Map<String, dynamic> credentials,
  ) async {
    return await _authAPI.validateWithLogin(credentials: credentials);
  }

  Future<SessionModel> createSession(Map<String, dynamic> requestToken) async {
    return await _authAPI.createSession(requestToken: requestToken);
  }

  Future<DeleteSessionResponse> deleteSession(
    String apiKey,
    Map<String, dynamic> sessionId,
  ) async {
    return await _authAPI.deleteSession(apiKey, sessionId);
  }
}
