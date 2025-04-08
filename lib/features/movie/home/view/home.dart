import 'package:cineverse/theme/app_fonts.dart';
import 'package:cineverse/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widget/dumb_widget/chip.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../bloc/home/home_cubit.dart';
import '../bloc/home/home_state.dart';
import 'package:cineverse/l10n/app_localizations.dart';
import '../widget/dumb_widget/movie_card_widget.dart';
import '../../../../widget/dumb_widget/error_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:cineverse/data/models/genre/genre_model.dart';
import 'package:cineverse/core/routes/app_routes.dart';
import '../../../../widget/dumb_widget/custom_message_widget.dart';

class HomeScreen extends StatefulWidget {
  final String type;
  const HomeScreen({super.key, this.type = 'movie'});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadData();
    onScrollLoadData();
  }

  loadData() {
    if (widget.type == 'movie') {
      context.read<HomeCubit>().loadMovies(reset: true);
      context.read<HomeCubit>().loadGenres();
    } else {
      context.read<HomeCubit>().loadTvShows(reset: true);
      context.read<HomeCubit>().loadTvGenres();
    }
  }

  onScrollLoadData() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (searchController.text.isEmpty) {
          if (widget.type == 'movie') {
            context.read<HomeCubit>().loadMovies();
          } else {
            context.read<HomeCubit>().loadTvShows();
          }
        } else {
          if (widget.type == 'movie') {
            context.read<HomeCubit>().searchMovies(
              searchController.text.trim(),
            );
          } else {
            context.read<HomeCubit>().searchTvShows(
              searchController.text.trim(),
            );
          }
        }
      }
    });
  }

  onChangeSearch(String value) {
    EasyDebounce.debounce(
      'search_debounce',
      const Duration(milliseconds: 500),
      () {
        if (value.isEmpty) {
          if (widget.type == 'movie') {
            context.read<HomeCubit>().loadMovies(reset: true);
          } else {
            context.read<HomeCubit>().loadTvShows(reset: true);
          }
        } else {
          if (widget.type == 'movie') {
            context.read<HomeCubit>().searchMovies(value.trim(), reset: true);
          } else {
            context.read<HomeCubit>().searchTvShows(value.trim(), reset: true);
          }
        }
      },
    );
  }

  List<GenreModel> selectedGenres = [];

  void toggleGenreSelection(GenreModel genre) {
    setState(() {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      } else {
        selectedGenres.add(genre);
      }
      searchController.text = '';
    });
    if (widget.type == 'movie') {
      context.read<HomeCubit>().loadMovies(reset: true, genres: selectedGenres);
    } else {
      context.read<HomeCubit>().loadTvShows(
        reset: true,
        genres: selectedGenres,
      );
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    EasyDebounce.cancel('search_debounce');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.search)),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                TextFormField(
                  controller: searchController,
                  onChanged: onChangeSearch,
                  style: AppFonts.body1.copyWith(color: AppColors.white),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.search,
                    hintText: AppLocalizations.of(context)!.searchForMovie,
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                ),
                SizedBox(height: 20.h),
                Text(
                  AppLocalizations.of(context)!.filters,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 12.h),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Skeletonizer(
                    enabled: state is HomeLoadingState && state.genres.isEmpty,
                    child: Row(
                      children: [
                        for (var genre in state.genres)
                          Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: ChipWidget(
                              name: genre.name,
                              isSelected: selectedGenres.contains(genre),
                              onPressed: () => toggleGenreSelection(genre),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child:
                      state is HomeErrorState &&
                              state.movies.isEmpty &&
                              state.genres.isEmpty
                          ? CustomErrorWidget(
                            error: state.error,
                            onPressed: () {
                              context.read<HomeCubit>().loadMovies();
                            },
                          )
                          : state is HomeLoadedState &&
                              state.movies.isEmpty &&
                              state.genres.isNotEmpty
                          ? CustomMessageWidget(message: 'No movies found')
                          : Skeletonizer(
                            enabled: state is HomeLoadingState,
                            child: GridView.builder(
                              controller: scrollController,
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.3,
                                    mainAxisSpacing: 16.h,
                                    crossAxisSpacing: 16.w,
                                  ),
                              itemCount: state.movies.length,
                              itemBuilder: (context, index) {
                                final movie = state.movies[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.movieDetails,
                                      arguments: {
                                        'movie': movie,
                                        'type': widget.type,
                                      },
                                    );
                                  },
                                  child: MovieCardWidget(movie: movie),
                                );
                              },
                            ),
                          ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
