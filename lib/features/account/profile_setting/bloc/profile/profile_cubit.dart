import 'package:cineverse/core/store/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cineverse/features/account/profile_setting/model/account_details_model.dart';
import 'package:cineverse/data/repo/account_repo.dart';
import 'package:cineverse/core/platform/device_info.dart';
import 'package:cineverse/di/di.dart';
import 'package:cineverse/features/account/profile_setting/model/device_detail_model.dart';
import 'package:cineverse/features/account/profile_setting/model/app_setting_model.dart';
import 'package:cineverse/features/account/profile_setting/bloc/profile/profile_state.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cineverse/data/repo/auth_repo.dart';
import 'package:cineverse/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
    : super(
        ProfileInitial(
          accountDetails: AccountDetailsModel(
            id: 0,
            name: '',
            username: '',
            includeAdult: false,
            language: '',
            country: '',
            avatar: Avatar(
              gravatar: Gravatar(hash: ''),
              tmdb: TMDB(avatarPath: ''),
            ),
          ),
          favoriteMoviesCount: 0,
          watchlistMoviesCount: 0,
          favoriteTVShowsCount: 0,
          watchlistTVShowsCount: 0,
          deviceDetail: DeviceDetailModel(
            deviceModel: '',
            deviceOs: '',
            storage: '',
            battery: '',
          ),
          appSetting: AppSettingModel(language: 'en', theme: 'light'),
        ),
      ) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('theme') ?? 'system';
    final savedLanguage = prefs.getString('language') ?? 'en';

    emit(
      ProfileLoadedState(
        accountDetails: state.accountDetails,
        favoriteMoviesCount: state.favoriteMoviesCount,
        watchlistMoviesCount: state.watchlistMoviesCount,
        favoriteTVShowsCount: state.favoriteTVShowsCount,
        watchlistTVShowsCount: state.watchlistTVShowsCount,
        deviceDetail: state.deviceDetail,
        appSetting: AppSettingModel(theme: savedTheme, language: savedLanguage),
      ),
    );
  }

  Future<void> logout() async {
    final secureStorage = SecureStorageService();
    final sessionId = await secureStorage.getSessionId();

    final authRepo = getIt<AuthRepo>();
    await authRepo.deleteSession(ApiConstants.apiKey, {
      'session_id': sessionId,
    });

    await secureStorage.deleteSessionId();
  }

  Future<void> loadProfile() async {
    final accountRepo = getIt<AccountRepo>();
    final deviceInfoService = getIt<DeviceInfoService>();
    final prefs = await SharedPreferences.getInstance();
    final language = prefs.getString('language');
    final theme = prefs.getString('theme');

    try {
      final accountDetails = await accountRepo.getAccountDetails();
      final favoriteMovies = await accountRepo.getFavoriteMovies();
      final watchlistMovies = await accountRepo.getWatchlistMovies();
      final favoriteTVShows = await accountRepo.getFavoriteTVShows();
      final watchlistTVShows = await accountRepo.getWatchlistTVShows();
      final deviceInfo = await deviceInfoService.getDeviceInfo();

      final deviceDetail = DeviceDetailModel(
        deviceModel: deviceInfo.deviceModel,
        deviceOs: deviceInfo.osVersion,
        storage: deviceInfo.availableStorage,
        battery: deviceInfo.batteryLevel,
      );

      emit(
        ProfileLoadedState(
          accountDetails: accountDetails,
          favoriteMoviesCount: favoriteMovies.totalResults,
          watchlistMoviesCount: watchlistMovies.totalResults,
          favoriteTVShowsCount: favoriteTVShows.totalResults,
          watchlistTVShowsCount: watchlistTVShows.totalResults,
          deviceDetail: deviceDetail,
          appSetting: AppSettingModel(
            language: language ?? 'en',
            theme: theme ?? 'dark',
          ),
        ),
      );
    } on DioException catch (e) {
      emit(
        ProfileErrorState(
          error: e.error.toString(),
          accountDetails: state.accountDetails,
          favoriteMoviesCount: state.favoriteMoviesCount,
          watchlistMoviesCount: state.watchlistMoviesCount,
          favoriteTVShowsCount: state.favoriteTVShowsCount,
          watchlistTVShowsCount: state.watchlistTVShowsCount,
          deviceDetail: state.deviceDetail,
          appSetting: state.appSetting,
        ),
      );
    }
  }

  void updateLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
    emit(
      state is ProfileLoadedState
          ? (state as ProfileLoadedState).copyWith(
            appSetting: AppSettingModel(
              language: language,
              theme: state.appSetting.theme,
            ),
          )
          : state,
    );
  }

  void updateTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
    emit(
      state is ProfileLoadedState
          ? (state as ProfileLoadedState).copyWith(
            appSetting: AppSettingModel(
              language: state.appSetting.language,
              theme: theme,
            ),
          )
          : state,
    );
  }
}
