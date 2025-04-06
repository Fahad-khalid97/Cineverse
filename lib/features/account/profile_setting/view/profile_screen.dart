import 'package:cineverse/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/dumb_widget/profile_option.dart';
import '../../../../theme/app_colors.dart';
import '../widget/dumb_widget/device_info.dart';
import 'package:cineverse/l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              CircleAvatar(
                radius: 60.r,
                backgroundImage: AssetImage(AppImage.person),
              ),
              SizedBox(height: 14.h),
              Text(
                'Fahad Khalid',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 4.h),
              Text(
                'Joined in 2025',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 4.h),
              Text('Pakistan', style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 25.h),
              Column(
                spacing: 28.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileOption(
                    title: AppLocalizations.of(context)!.watchedMovies,
                    value: 45,
                  ),
                  ProfileOption(
                    title: AppLocalizations.of(context)!.favoritesMovies,
                    value: 4,
                  ),
                  Text(
                    AppLocalizations.of(context)!.deviceInformation,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  DeviceInfo(
                    title: AppLocalizations.of(context)!.deviceModel,
                    value: 'IPhone 4s',
                  ),
                  DeviceInfo(
                    title: AppLocalizations.of(context)!.osVersion,
                    value: '18.0.1',
                  ),
                  DeviceInfo(
                    title: AppLocalizations.of(context)!.availableStorageSpace,
                    value: '43 GB',
                  ),
                  DeviceInfo(
                    title: AppLocalizations.of(context)!.batteryLevel,
                    value: '88%',
                  ),
                  Text(
                    "App Settings",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4.h,
                    children: [
                      Text(
                        "Set Language",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            value: 'English',
                            child: Text('English'),
                          ),
                          DropdownMenuItem(
                            value: 'Arabic',
                            child: Text('Arabic'),
                          ),
                          DropdownMenuItem(
                            value: 'French',
                            child: Text('French'),
                          ),
                          DropdownMenuItem(
                            value: 'Spanish',
                            child: Text('Spanish'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4.h,
                    children: [
                      Text(
                        "Set Theme",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            value: 'Light',
                            child: Text('Light'),
                          ),
                          DropdownMenuItem(value: 'Dark', child: Text('Dark')),
                          DropdownMenuItem(
                            value: 'System',
                            child: Text('System'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
