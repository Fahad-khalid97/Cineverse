import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../theme/app_colors.dart';
import '../../../../../../theme/app_images.dart';

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
            image: DecorationImage(
              image:
                  image.isEmpty
                      ? const AssetImage(AppImage.personAvatar)
                      : CachedNetworkImageProvider(
                        image,
                        cacheKey: '${image}cast',
                      ),
              fit: BoxFit.cover,
            ),
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        SizedBox(height: 8.h),
        Text(name, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
