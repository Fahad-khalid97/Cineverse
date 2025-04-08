import 'package:cineverse/features/account/profile_setting/model/account_details_model.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/dumb_widget/profile_option.dart';
import '../widget/dumb_widget/device_info.dart';
import 'package:cineverse/l10n/app_localizations.dart';
import '../bloc/profile/profile_cubit.dart';
import '../bloc/profile/profile_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/device_detail_model.dart';
import '../model/app_setting_model.dart';
import '../enum/profile_setting.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BlocSelector<ProfileCubit, ProfileState, AccountDetailsModel>(
                selector: (state) => state.accountDetails,
                builder:
                    (context, accountDetails) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          backgroundImage:
                              accountDetails.avatar.tmdb.avatarPath != null &&
                                      accountDetails.avatar.tmdb.avatarPath !=
                                          ''
                                  ? CachedNetworkImageProvider(
                                    accountDetails.avatar.tmdb.avatarPath!,
                                  )
                                  : AssetImage(AppImage.personAvatar),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          accountDetails.name,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Joined in 2025',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          accountDetails.country,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
              ),
              ////Movies Section
              SizedBox(height: 28.h),
              BlocSelector<ProfileCubit, ProfileState, int>(
                selector: (state) => state.watchlistMoviesCount,
                builder:
                    (context, watchlistMoviesCount) => ProfileOption(
                      title: AppLocalizations.of(context)!.watchedMovies,
                      value: watchlistMoviesCount,
                    ),
              ),
              SizedBox(height: 28.h),
              BlocSelector<ProfileCubit, ProfileState, int>(
                selector: (state) => state.favoriteMoviesCount,
                builder:
                    (context, favoriteMoviesCount) => ProfileOption(
                      title: AppLocalizations.of(context)!.favoritesMovies,
                      value: favoriteMoviesCount,
                    ),
              ),
              SizedBox(height: 28.h),
              BlocSelector<ProfileCubit, ProfileState, DeviceDetailModel>(
                selector: (state) => state.deviceDetail,
                builder:
                    (context, deviceDetail) => Column(
                      spacing: 28.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.deviceInformation,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        DeviceInfo(
                          title: AppLocalizations.of(context)!.deviceModel,
                          value: deviceDetail.deviceModel,
                        ),
                        DeviceInfo(
                          title: AppLocalizations.of(context)!.osVersion,
                          value: deviceDetail.deviceOs,
                        ),
                        DeviceInfo(
                          title:
                              AppLocalizations.of(
                                context,
                              )!.availableStorageSpace,
                          value: deviceDetail.storage,
                        ),
                        DeviceInfo(
                          title: AppLocalizations.of(context)!.batteryLevel,
                          value: deviceDetail.battery,
                        ),
                        Text(
                          AppLocalizations.of(context)!.appSettings,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
              ),
              SizedBox(height: 28.h),
              BlocSelector<ProfileCubit, ProfileState, AppSettingModel>(
                selector: (state) => state.appSetting,
                builder:
                    (context, appSetting) => Column(
                      spacing: 28.h,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 4.h,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.setLanguage,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            DropdownButton(
                              value: appSetting.language,
                              items:
                                  AppLanguage.values
                                      .map(
                                        (language) => DropdownMenuItem(
                                          value: language.name,
                                          child: Text(language.name),
                                        ),
                                      )
                                      .toList(),

                              onChanged: (value) {
                                context.read<ProfileCubit>().updateLanguage(
                                  value.toString(),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 4.h,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.setTheme,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            DropdownButton(
                              value: appSetting.theme,
                              items:
                                  AppThemeMode.values
                                      .map(
                                        (theme) => DropdownMenuItem(
                                          value: theme.name,
                                          child: Text(theme.name),
                                        ),
                                      )
                                      .toList(),

                              onChanged: (value) {
                                context.read<ProfileCubit>().updateTheme(
                                  value.toString(),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
