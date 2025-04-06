import 'package:cineverse/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cineverse/theme/app_fonts.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    this.name,
    this.isSelected = false,
    this.onPressed,
  });

  final String? name;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color:
              isDarkMode
                  ? isSelected
                      ? AppColors.secondaryTextColor
                      : AppColors.secondary
                  : isSelected
                  ? AppColors.primary
                  : AppColors.secondaryTextColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            name ?? '--',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color:
                  isDarkMode
                      ? isSelected
                          ? AppColors.primary
                          : AppColors.secondaryTextColor
                      : isSelected
                      ? AppColors.white
                      : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
