import 'package:cineverse/data/models/media/movie_model.dart';
import 'package:cineverse/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:cineverse/features/movie/media_details/view/movie_details_screen.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({
    super.key,
    required this.movies,
    required this.scrollController,
  });

  final List<MovieModel> movies;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        controller: scrollController,
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MediaDetailScreen(movie: movie),
                ),
              );
            },
            child: Padding(
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
                  SizedBox(
                    width: 130.w,
                    child: Text(
                      movie.title ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
