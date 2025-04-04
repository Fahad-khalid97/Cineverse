import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import '../../../../../../theme/app_colors.dart';
import '../../../../../../theme/app_fonts.dart';

class RatingProgressBar extends StatelessWidget {
  const RatingProgressBar({
    super.key,
    required this.rating,
    required this.progress,
    this.maxSteps = 5,
  });

  final int rating;
  final int progress;
  final int maxSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rating.toString(),
          style: AppFonts.subtitle2Regular.copyWith(color: AppColors.white),
        ),
        SizedBox(
          width: 168.w,
          child: LinearProgressBar(
            minHeight: 8.h,
            maxSteps: maxSteps,
            currentStep: progress,
            borderRadius: BorderRadius.circular(12.r),
            progressType: LinearProgressBar.progressTypeLinear,
            backgroundColor: AppColors.secondary,
            progressColor: AppColors.buttonColor,
          ),
        ),
        Text(
          '${(progress / maxSteps * 100).toInt()}%',
          style: AppFonts.subtitle2Regular.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
