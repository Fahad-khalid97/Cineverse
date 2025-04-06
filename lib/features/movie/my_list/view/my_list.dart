import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../widget/dumb_widget/chip.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/my_list/my_list_cubit.dart';
import '../bloc/my_list/my_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widget/dumb_widget/error_widget.dart';
import '../widget/dumb_widget/movies_list_widget.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  final ScrollController popularController = ScrollController();
  final ScrollController topRatedController = ScrollController();
  final ScrollController upcomingController = ScrollController();
  final ScrollController nowPlayingController = ScrollController();

  bool isLoadingPopular = false;
  bool isLoadingTopRated = false;
  bool isLoadingUpcoming = false;
  bool isLoadingNowPlaying = false;

  @override
  void initState() {
    super.initState();
    popularController.addListener(() => onScroll('Popular', popularController));
    topRatedController.addListener(
      () => onScroll('Top Rated', topRatedController),
    );
    upcomingController.addListener(
      () => onScroll('Upcoming', upcomingController),
    );
    nowPlayingController.addListener(
      () => onScroll('Now Playing', nowPlayingController),
    );
    loadData();
  }

  void onScroll(String type, ScrollController controller) {
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - 50) {
      switch (type) {
        case 'Popular':
          if (!isLoadingPopular) {
            isLoadingPopular = true;
            context.read<MyListCubit>().loadPopularMovies().whenComplete(() {
              isLoadingPopular = false;
            });
          }
          break;

        case 'Top Rated':
          if (!isLoadingTopRated) {
            isLoadingTopRated = true;
            context.read<MyListCubit>().loadTopRatedMovies().whenComplete(() {
              isLoadingTopRated = false;
            });
          }
          break;

        case 'Upcoming':
          if (!isLoadingUpcoming) {
            isLoadingUpcoming = true;
            context.read<MyListCubit>().loadUpcomingMovies().whenComplete(() {
              isLoadingUpcoming = false;
            });
          }
          break;

        case 'Now Playing':
          if (!isLoadingNowPlaying) {
            isLoadingNowPlaying = true;
            context.read<MyListCubit>().loadNowPlayingMovies().whenComplete(() {
              isLoadingNowPlaying = false;
            });
          }
          break;
      }
    }
  }

  void loadData() {
    context.read<MyListCubit>().loadPopularMovies();
    context.read<MyListCubit>().loadTopRatedMovies();
    context.read<MyListCubit>().loadNowPlayingMovies();
    context.read<MyListCubit>().loadUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.movies)),
      body: BlocBuilder<MyListCubit, MyListState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 12.w),
            child:
                state is MyListError
                    ? CustomErrorWidget(
                      error: state.error,
                      onPressed: () {
                        loadData();
                      },
                    )
                    : Skeletonizer(
                      enabled: state is MyListLoading,
                      child: SingleChildScrollView(
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
                                  ChipWidget(name: 'Popular'),
                                  ChipWidget(name: 'Top Rated'),
                                  ChipWidget(name: 'Upcoming'),
                                  ChipWidget(name: 'Now Playing'),
                                ],
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.popularMovies,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            MoviesListWidget(
                              movies: state.popularMovies,
                              scrollController: popularController,
                            ),
                            Text(
                              AppLocalizations.of(context)!.topRatedMovies,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            MoviesListWidget(
                              movies: state.topRatedMovies,
                              scrollController: topRatedController,
                            ),
                            Text(
                              AppLocalizations.of(context)!.nowPlayingMovies,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            MoviesListWidget(
                              movies: state.nowPlaying,
                              scrollController: nowPlayingController,
                            ),
                            Text(
                              AppLocalizations.of(context)!.upcomingMovies,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            MoviesListWidget(
                              movies: state.upcomingMovies,
                              scrollController: upcomingController,
                            ),
                          ],
                        ),
                      ),
                    ),
          );
        },
      ),
    );
  }
}
