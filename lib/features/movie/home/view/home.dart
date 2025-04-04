import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/theme/app_fonts.dart';
import 'package:cineverse/theme/app_colors.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widget/dumb_widget/chip.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../bloc/home/home_cubit.dart';
import '../bloc/home/home_state.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadMovies();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
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
                  style: AppFonts.body1.copyWith(color: AppColors.white),
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Search for a movie',
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
                  'Filters',
                  style: AppFonts.heading6.copyWith(color: AppColors.white),
                ),
                SizedBox(height: 12.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Skeletonizer(
                    enabled: state is HomeLoadingState,
                    child: Row(
                      children: [
                        for (var genre in state.genres)
                          Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: ChipWidget(name: genre.name),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child:
                      state is HomeErrorState
                          ? Center(
                            child: Column(
                              spacing: 16.h,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Error',
                                  style: AppFonts.heading6.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),

                                Text(
                                  state.error.split('Error:')[1].toString(),
                                  maxLines: 3,
                                  style: AppFonts.body2.copyWith(
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {
                                    context.read<HomeCubit>().loadMovies();
                                  },
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          )
                          : GridView.builder(
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
                              log((state is HomeLoadingState).toString());
                              final movie = state.movies[index];
                              return Skeletonizer(
                                enabled: state is HomeLoadingState,
                                child: Column(
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
                                                    cacheKey:
                                                        movie.id.toString(),
                                                  )
                                                  : AssetImage(AppImage.movie)
                                                      as ImageProvider,
                                        ),
                                        color: AppColors.secondary,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      movie.title,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            },
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
