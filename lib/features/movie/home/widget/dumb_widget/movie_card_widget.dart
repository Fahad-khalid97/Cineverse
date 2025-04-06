import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:cineverse/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/data/models/media/movie_model.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 95.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image:
                  movie.posterPath != null
                      ? CachedNetworkImageProvider(
                        movie.getPosterUrl(),
                        cacheKey: movie.id.toString(),
                      )
                      : AssetImage(AppImage.movie) as ImageProvider,
            ),
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          movie.title ?? '--',
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
