import 'package:cineverse/theme/app_colors.dart';
import 'package:cineverse/theme/app_fonts.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widget/dumb_widget/cast_member_card.dart';
import '../../../../widget/dumb_widget/chip.dart';
import '../widget/dumb_widget/rating_progress_bar.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:cineverse/data/models/media/movie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/media_detail/media_detail_cubit.dart';
import '../bloc/media_detail/media_detail_state.dart';
import '../../../../widget/dumb_widget/error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:cineverse/data/models/media/movie_review_model.dart';

class MediaDetailScreen extends StatefulWidget {
  const MediaDetailScreen({super.key, this.movie, this.type = 'movie'});

  final MovieModel? movie;
  final String? type;
  @override
  State<MediaDetailScreen> createState() => _MediaDetailScreenState();
}

class _MediaDetailScreenState extends State<MediaDetailScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    if (widget.type == 'movie') {
      context.read<MediaDetailCubit>().loadMovieDetail(widget.movie?.id ?? 0);
    } else {
      context.read<MediaDetailCubit>().loadTvDetail(widget.movie?.id ?? 0);
    }
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
    return authors.isEmpty
        ? 0
        : authors
            .where(
              (e) =>
                  ((e.rating ?? 0.0) / 2) > minRating &&
                  ((e.rating ?? 0.0) / 2) <= maxRating,
            )
            .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie?.title ?? widget.movie?.name ?? '--'),
      ),
      body: BlocConsumer<MediaDetailCubit, MediaDetailState>(
        listener: (context, state) {
          if (state is MediaDetailWatchlistAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)!.addToWatchlistSuccess,
                ),
              ),
            );
          }
          if (state is MediaDetailFavoritesAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)!.addToFavoritesSuccess,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is MediaDetailError) {
            return CustomErrorWidget(
              error: state.error,
              onPressed: () {
                loadData();
              },
            );
          }
          if ([
            MediaDetailLoaded,
            MediaDetailLoading,
            MediaDetailWatchlistAdded,
            MediaDetailFavoritesAdded,
          ].contains(state.runtimeType)) {
            return SafeArea(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight:
                      MediaQuery.of(context).size.height - kToolbarHeight,
                ),
                child: SingleChildScrollView(
                  child: Skeletonizer(
                    enabled: state is MediaDetailLoading,
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
                                state.movie.title ?? state.movie.name ?? '--',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),

                              SizedBox(height: 8.h),
                              Text(
                                '${state.movie.releaseDateFormatted} · ${state.movie.formattedRuntime} · R',
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
                                  children: [
                                    ...state.cast.map(
                                      (cast) => CastMemberCard(
                                        name: cast.name,
                                        image: cast.getPosterUrl,
                                      ),
                                    ),
                                    ...state.crew.map(
                                      (crew) => CastMemberCard(
                                        name: crew.name,
                                        image: crew.getPosterUrl,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),

                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<MediaDetailCubit>()
                                          .addToFavorites(
                                            widget.type.toString(),
                                          );
                                    },
                                    icon:
                                        state is MediaDetailFavoritesAdded
                                            ? FaIcon(
                                              FontAwesomeIcons.solidHeart,
                                            )
                                            : FaIcon(FontAwesomeIcons.heart),
                                  ),
                                  MaterialButton(
                                    height: 48.h,
                                    minWidth: 300.w,
                                    color: AppColors.secondary,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    onPressed: () {
                                      context
                                          .read<MediaDetailCubit>()
                                          .addToWatchlist(
                                            widget.type.toString(),
                                          );
                                    },
                                    child: Row(
                                      spacing: 6.w,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.bookmark_add_outlined,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          state is MediaDetailWatchlistAdded
                                              ? AppLocalizations.of(
                                                context,
                                              )!.addToWatchlistSuccess
                                              : AppLocalizations.of(
                                                context,
                                              )!.addToWatchlist,
                                          style: AppFonts.subtitle1Bold
                                              .copyWith(color: AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //add watchlist button
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
