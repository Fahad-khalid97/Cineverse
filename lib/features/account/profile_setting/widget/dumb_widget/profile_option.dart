import 'package:flutter/material.dart';
import 'package:cineverse/theme/app_colors.dart';

class ProfileOption extends StatelessWidget {
  const ProfileOption({super.key, required this.title, required this.value});

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
        ),
        const Spacer(),
        Text(
          value.toString(),
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
