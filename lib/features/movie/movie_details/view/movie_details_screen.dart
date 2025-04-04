import 'package:cineverse/theme/app_colors.dart';
import 'package:cineverse/theme/app_fonts.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/dumb_widget/cast_member_card.dart';
import '../../../../widget/dumb_widget/chip.dart';
import '../widget/dumb_widget/rating_progress_bar.dart';

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
                          spacing: 12.w,
                          children: [
                            ChipWidget(name: 'Action'),
                            ChipWidget(name: 'Fantasy'),
                            ChipWidget(name: 'Adventure'),
                            ChipWidget(name: 'Horror'),
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
