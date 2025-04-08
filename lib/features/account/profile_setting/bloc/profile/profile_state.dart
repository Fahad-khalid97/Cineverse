import 'package:cineverse/features/account/profile_setting/model/account_details_model.dart';
import 'package:cineverse/features/account/profile_setting/model/app_setting_model.dart';
import 'package:cineverse/features/account/profile_setting/model/device_detail_model.dart';
import 'package:equatable/equatable.dart';

sealed class ProfileState extends Equatable {
  final AccountDetailsModel accountDetails;
  final int favoriteMoviesCount;
  final int watchlistMoviesCount;
  final DeviceDetailModel deviceDetail;
  final AppSettingModel appSetting;

  const ProfileState({
    required this.accountDetails,
    required this.favoriteMoviesCount,
    required this.watchlistMoviesCount,
    required this.deviceDetail,
    required this.appSetting,
  });
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial({
    required super.accountDetails,
    required super.favoriteMoviesCount,
    required super.watchlistMoviesCount,
    required super.deviceDetail,
    required super.appSetting,
  });

  @override
  List<Object?> get props => [
    accountDetails,
    favoriteMoviesCount,
    watchlistMoviesCount,
    deviceDetail,
    appSetting,
  ];
}

final class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState({
    required super.accountDetails,
    required super.favoriteMoviesCount,
    required super.watchlistMoviesCount,
    required super.deviceDetail,
    required super.appSetting,
  });

  @override
  List<Object?> get props => [
    accountDetails,
    favoriteMoviesCount,
    watchlistMoviesCount,
    deviceDetail,
    appSetting,
  ];
}

final class ProfileLoadedState extends ProfileState {
  const ProfileLoadedState({
    required super.accountDetails,
    required super.favoriteMoviesCount,
    required super.watchlistMoviesCount,
    required super.deviceDetail,
    required super.appSetting,
  });

  ProfileLoadedState copyWith({
    AccountDetailsModel? accountDetails,
    int? favoriteMoviesCount,
    int? watchlistMoviesCount,
    DeviceDetailModel? deviceDetail,
    AppSettingModel? appSetting,
  }) {
    return ProfileLoadedState(
      accountDetails: accountDetails ?? this.accountDetails,
      favoriteMoviesCount: favoriteMoviesCount ?? this.favoriteMoviesCount,
      watchlistMoviesCount: watchlistMoviesCount ?? this.watchlistMoviesCount,
      deviceDetail: deviceDetail ?? this.deviceDetail,
      appSetting: appSetting ?? this.appSetting,
    );
  }

  @override
  List<Object?> get props => [
    accountDetails,
    favoriteMoviesCount,
    watchlistMoviesCount,
    deviceDetail,
    appSetting,
  ];
}

final class ProfileErrorState extends ProfileState {
  final String error;
  const ProfileErrorState({
    required super.accountDetails,
    required super.favoriteMoviesCount,
    required super.watchlistMoviesCount,
    required super.deviceDetail,
    required super.appSetting,
    required this.error,
  });

  @override
  List<Object?> get props => [
    accountDetails,
    favoriteMoviesCount,
    watchlistMoviesCount,
    deviceDetail,
    appSetting,
    error,
  ];
}
