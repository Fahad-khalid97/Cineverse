import 'package:flutter/material.dart';
import 'package:cineverse/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cineverse/theme/app_fonts.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
        ),
        Text(
          value,
          style: AppFonts.subtitle2Regular.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
