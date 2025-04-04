import 'package:cineverse/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cineverse/theme/app_fonts.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          name ?? '--',
          style: AppFonts.subtitle2Regular.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
