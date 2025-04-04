import 'package:cineverse/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/dumb_widget/profile_option.dart';
import '../../../../theme/app_colors.dart';
import '../widget/dumb_widget/device_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 4.h),
              Text(
                'Joined in 2025',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Pakistan',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
              SizedBox(height: 25.h),
              Column(
                spacing: 28.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileOption(title: 'Watched Movies', value: 45),
                  ProfileOption(title: 'Favorite Movies', value: 4),
                  Text(
                    'Device Information',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color: AppColors.white),
                  ),
                  DeviceInfo(title: 'Device Name', value: 'IPhone 4s'),
                  DeviceInfo(title: 'OS Version', value: '18.0.1'),
                  DeviceInfo(title: 'Storage', value: '43 GB'),
                  DeviceInfo(title: 'Battery Level', value: '88%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
