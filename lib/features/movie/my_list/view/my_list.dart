import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../widget/dumb_widget/chip.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_images.dart';
import '../../../../l10n/app_localizations.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.movies)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12.w,
                  children: [
                    ChipWidget(name: 'Action'),
                    ChipWidget(name: 'Adventure'),
                    ChipWidget(name: 'Animation'),
                    ChipWidget(name: 'Comedy'),
                    ChipWidget(name: 'Crime'),
                    ChipWidget(name: 'Documentary'),
                    ChipWidget(name: 'Drama'),
                  ],
                ),
              ),
              Text(
                AppLocalizations.of(context)!.popularMovies,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                child: Skeletonizer(
                  enabled: false,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 130.w,
                              height: 190.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImage.movie),
                                  fit: BoxFit.cover,
                                ),
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'The Batman',
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.topRatedMovies,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              Expanded(
                child: Skeletonizer(
                  enabled: false,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 130.w,
                              height: 190.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImage.movie),
                                  fit: BoxFit.cover,
                                ),
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'The Batman',
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
