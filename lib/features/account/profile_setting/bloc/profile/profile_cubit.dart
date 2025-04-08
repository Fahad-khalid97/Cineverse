import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cineverse/features/account/profile_setting/model/account_details_model.dart';
import 'package:cineverse/data/repo/account_repo.dart';
import 'package:cineverse/core/platform/device_info.dart';
import 'package:cineverse/di/di.dart';
import 'package:cineverse/features/account/profile_setting/model/device_detail_model.dart';
import 'package:cineverse/features/account/profile_setting/model/app_setting_model.dart';
import 'package:cineverse/features/account/profile_setting/bloc/profile/profile_state.dart';
import 'package:dio/dio.dart';

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
          deviceDetail: DeviceDetailModel(
            deviceModel: '',
            deviceOs: '',
            storage: '',
            battery: '',
          ),
          appSetting: AppSettingModel(language: 'en', theme: 'light'),
        ),
      );

  Future<void> loadProfile() async {
    final accountRepo = getIt<AccountRepo>();
    final deviceInfoService = getIt<DeviceInfoService>();

    try {
      final accountDetails = await accountRepo.getAccountDetails();
      final favoriteMovies = await accountRepo.getFavoriteMovies();
      final watchlistMovies = await accountRepo.getWatchlistMovies();
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
          deviceDetail: deviceDetail,
          appSetting: AppSettingModel(language: 'en', theme: 'dark'),
        ),
      );
    } on DioException catch (e) {
      emit(
        ProfileErrorState(
          error: e.error.toString(),
          accountDetails: state.accountDetails,
          favoriteMoviesCount: state.favoriteMoviesCount,
          watchlistMoviesCount: state.watchlistMoviesCount,
          deviceDetail: state.deviceDetail,
          appSetting: state.appSetting,
        ),
      );
    }
  }

  void updateLanguage(String language) {
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

  void updateTheme(String theme) {
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
