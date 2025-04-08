import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import '../../../../../../theme/app_colors.dart';

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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final clampedProgress = progress.clamp(0, maxSteps);
    final percent = ((clampedProgress / maxSteps) * 100).toInt();
    return Row(
      spacing: 8.w,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(rating.toString(), style: Theme.of(context).textTheme.titleSmall),
        SizedBox(
          width: 168.w,
          child: LinearProgressBar(
            minHeight: 8.h,
            maxSteps: maxSteps,
            currentStep: progress,
            borderRadius: BorderRadius.circular(12.r),
            progressType: LinearProgressBar.progressTypeLinear,
            backgroundColor:
                isDarkMode ? AppColors.secondary : AppColors.secondaryTextColor,
            progressColor: AppColors.buttonColor,
          ),
        ),
        Text('$percent%', style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
