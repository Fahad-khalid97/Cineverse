import 'package:cineverse/theme/app_colors.dart';
import 'package:cineverse/theme/app_fonts.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/dumb_widget/cast_member_card.dart';
import '../../../../widget/dumb_widget/chip.dart';
import '../widget/dumb_widget/rating_progress_bar.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:cineverse/data/models/media/movie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/movie_detail/movie_detail_cubit.dart';
import '../bloc/movie_detail/movie_detail_state.dart';
import '../../../../widget/dumb_widget/error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:cineverse/data/models/media/movie_review_model.dart';
import 'dart:developer';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, this.movie});

  final MovieModel? movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailCubit>().loadMovieDetail(widget.movie?.id ?? 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  int getRatingCount(
    List<AuthorDetailsModel> authors,
    double minRating,
    double maxRating,
  ) {
    authors.map((e) => {log(e.rating.toString())});
    return authors.isEmpty
        ? 0
        : authors
            .where(
              (e) =>
                  (e.rating ?? 0.0 / 2) > minRating &&
                  (e.rating ?? 0.0 / 2) <= maxRating,
            )
            .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie?.title ?? '--')),
      floatingActionButton: SizedBox(
        width: 340.w,
        height: 48.h,
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          label: Text(
            'Add to Watchlist',
            style: AppFonts.subtitle1Bold.copyWith(color: AppColors.white),
          ),
          icon: const Icon(Icons.bookmark_add_outlined, color: Colors.white),
        ),
      ),
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailError) {
            return CustomErrorWidget(
              error: state.error,
              onPressed: () {
                context.read<MovieDetailCubit>().loadMovieDetail(
                  widget.movie?.id ?? 0,
                );
              },
            );
          }
          if (state is MovieDetailLoaded || state is MovieDetailLoading) {
            return SafeArea(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight:
                      MediaQuery.of(context).size.height - kToolbarHeight,
                ),
                child: SingleChildScrollView(
                  child: Skeletonizer(
                    enabled: state is MovieDetailLoading,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 300.h,
                          child:
                              widget.movie?.backdropPath != null
                                  ? CachedNetworkImage(
                                    imageUrl: widget.movie?.backdropPath ?? '',
                                    cacheKey: widget.movie?.id.toString(),
                                    fit: BoxFit.cover,
                                  )
                                  : Image.asset(
                                    AppImage.movie,
                                    fit: BoxFit.cover,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Text(
                                state.movie.title ?? '--',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),

                              SizedBox(height: 8.h),
                              Text(
                                '${widget.movie?.releaseDate!.split('-')[0]} · ${state.movie.formattedRuntime} · R',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),

                              SizedBox(height: 16.h),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  spacing: 12.w,
                                  children:
                                      state.movie.genres
                                          ?.map((e) => ChipWidget(name: e.name))
                                          .toList() ??
                                      [],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              //rating
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    spacing: 6.h,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.rating?.toString() ?? '0',
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.displayLarge,
                                      ),
                                      RatingBar.readOnly(
                                        filledIcon: Icons.star,
                                        size: 18.h,
                                        filledColor: AppColors.buttonColor,
                                        emptyIcon: Icons.star_border,
                                        initialRating: state.rating ?? 0,
                                        maxRating: 5,
                                      ),
                                      Text(
                                        '${state.reviews.length} ${AppLocalizations.of(context)!.reviews}',
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    spacing: 8.h,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RatingProgressBar(
                                        rating: 5,
                                        progress: getRatingCount(
                                          state.authorDetails,
                                          4.99,
                                          5,
                                        ),
                                        maxSteps: 5,
                                      ),
                                      RatingProgressBar(
                                        rating: 4,
                                        progress: getRatingCount(
                                          state.authorDetails,
                                          3.99,
                                          4.99,
                                        ),
                                        maxSteps: 5,
                                      ),
                                      RatingProgressBar(
                                        rating: 3,
                                        progress: getRatingCount(
                                          state.authorDetails,
                                          3,
                                          3.99,
                                        ),
                                        maxSteps: 5,
                                      ),
                                      RatingProgressBar(
                                        rating: 2,
                                        progress: getRatingCount(
                                          state.authorDetails,
                                          2,
                                          2.99,
                                        ),
                                        maxSteps: 5,
                                      ),
                                      RatingProgressBar(
                                        rating: 1,
                                        progress: getRatingCount(
                                          state.authorDetails,
                                          0,
                                          1.99,
                                        ),
                                        maxSteps: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                state.movie.overview ?? '',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                AppLocalizations.of(context)!.castAndCrew,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(height: 16.h),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  spacing: 12.h,
                                  children:
                                      state.cast
                                          .map(
                                            (e) => CastMemberCard(
                                              name: e.name,
                                              image: e.getPosterUrl(),
                                            ),
                                          )
                                          .toList(),
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
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
