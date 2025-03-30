import 'package:cineverse/theme/app_colors.dart';
import 'package:cineverse/theme/app_fonts.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, this.movieId});

  final movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Batman')),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - kToolbarHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300.h,
                  child: Image.asset(AppImage.movie, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'The Batman',
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '2022 · 2h 56m · R',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 16.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GenreWidget(name: 'Action'),
                            SizedBox(width: 12.w),
                            GenreWidget(name: 'Fantasy'),
                            SizedBox(width: 12.w),
                            GenreWidget(name: 'Adventure'),
                            SizedBox(width: 12.w),
                            GenreWidget(name: 'Horror'),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      //rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            spacing: 6.h,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '8.4',
                                style: AppFonts.heading.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              RatingBar.readOnly(
                                filledIcon: Icons.star,
                                size: 18.h,
                                filledColor: AppColors.buttonColor,
                                emptyIcon: Icons.star_border,
                                initialRating: 4,
                                maxRating: 5,
                              ),
                              Text(
                                '13k reviews',
                                style: AppFonts.subtitle2Regular.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: 8.h,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingProgressBar(
                                rating: 5,
                                progress: 4,
                                maxSteps: 5,
                              ),
                              RatingProgressBar(
                                rating: 4,
                                progress: 3,
                                maxSteps: 5,
                              ),
                              RatingProgressBar(
                                rating: 3,
                                progress: 2,
                                maxSteps: 5,
                              ),
                              RatingProgressBar(
                                rating: 2,
                                progress: 4,
                                maxSteps: 5,
                              ),
                              RatingProgressBar(
                                rating: 1,
                                progress: 1,
                                maxSteps: 5,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement. As he delves into the mystery, he uncovers a trail of secrets that lead to the billionaire playboy Thomas Wayne.",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Cast & Crew',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 16.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 12.h,
                          children: [
                            CastMemberCard(
                              name: 'Robert Pattinson',
                              image: AppImage.cast,
                            ),
                            CastMemberCard(
                              name: 'Robert Pattinson',
                              image: AppImage.cast,
                            ),
                            CastMemberCard(
                              name: 'Robert Pattinson',
                              image: AppImage.cast,
                            ),
                            CastMemberCard(
                              name: 'Robert Pattinson',
                              image: AppImage.cast,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class CastMemberCard extends StatelessWidget {
  const CastMemberCard({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 160.w,
          height: 213.h,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}

class GenreWidget extends StatelessWidget {
  const GenreWidget({super.key, this.name});

  final name;

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
