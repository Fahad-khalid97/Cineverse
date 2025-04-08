import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../data/repo/auth_repo.dart';
import 'login_state.dart';
import 'package:cineverse/core/api/dio_client.dart';
import 'package:cineverse/di/di.dart';
import 'package:dio/dio.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;

  LoginCubit(this._authRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    final dioClient = getIt<DioClient>();
    try {
      emit(LoginLoading());
      final requestTokenResponse = await _authRepo.createRequestToken();
      if (!requestTokenResponse.success) {
        emit(LoginError(message: 'Failed to create request token'));
        return;
      }

      final validateResponse = await _authRepo.validateWithLogin({
        'username': email,
        'password': password,
        'request_token': requestTokenResponse.requestToken,
      });

      if (!validateResponse.success) {
        emit(LoginError(message: 'Invalid credentials'));
        return;
      }

      final sessionResponse = await _authRepo.createSession({
        'request_token': validateResponse.requestToken,
      });

      dioClient.sessionId = sessionResponse.sessionId;

      if (!sessionResponse.success) {
        emit(LoginError(message: 'Failed to create session'));
        return;
      }

      emit(LoginSuccess());
    } on DioException catch (e) {
      emit(LoginError(message: e.error.toString()));
    }
  }

  void resetState() {
    emit(LoginInitial());
  }
}
