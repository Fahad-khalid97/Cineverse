import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cineverse/data/repo/search_repo.dart';
import 'home_state.dart';
import 'package:cineverse/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/data/models/genre/genre_model.dart';
import 'package:dio/dio.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial(movies: [], genres: [], page: 0));

  /// Loads movies with optional genre filtering and pagination.
  /// If `reset` is true, it replaces the current movie list with fresh results.
  /// Otherwise, it appends the next page of results.
  void loadMovies({
    bool reset = false,
    List<GenreModel> genres = const [],
  }) async {
    var searchRepo = getIt<SearchRepo>();
    try {
      final moviesResponse = await searchRepo.discoverMovies(
        page: reset ? 1 : state.page + 1,
        withGenres: genres.map((e) => e.id.toString()).join(','),
      );

      emit(
        HomeLoadedState(
          movies:
              reset
                  ? moviesResponse.results
                  : [...state.movies, ...moviesResponse.results],
          genres: state.genres,
          page: reset ? 1 : state.page + 1,
        ),
      );
    } on DioException catch (e) {
      // Emit error state with current data preserved
      emit(
        HomeErrorState(
          error: e.error.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }

  /// Loads tv shows with optional genre filtering and pagination.
  void loadTvShows({
    bool reset = false,
    List<GenreModel> genres = const [],
  }) async {
    var searchRepo = getIt<SearchRepo>();
    try {
      final tvShowsResponse = await searchRepo.discoverTvShows(
        page: reset ? 1 : state.page + 1,
        withGenres: genres.map((e) => e.id.toString()).join(','),
      );

      emit(
        HomeLoadedState(
          movies:
              reset
                  ? tvShowsResponse.results
                  : [...state.movies, ...tvShowsResponse.results],
          genres: state.genres,
          page: reset ? 1 : state.page + 1,
        ),
      );
    } on DioException catch (e) {
      // Emit error state with current data preserved
      emit(
        HomeErrorState(
          error: e.error.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }

  /// Loads available movie genres and updates state.
  void loadGenres() async {
    var searchRepo = getIt<SearchRepo>();
    try {
      final genresResponse = await searchRepo.getMovieGenres();
      emit(
        HomeLoadedState(
          movies: state.movies,
          genres: genresResponse.genres,
          page: state.page,
        ),
      );
    } on DioException catch (e) {
      emit(
        HomeErrorState(
          error: e.error.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }

  /// Loads available tv genres and updates state.
  void loadTvGenres() async {
    var searchRepo = getIt<SearchRepo>();
    try {
      final genresResponse = await searchRepo.getTvGenres();
      emit(
        HomeLoadedState(
          movies: state.movies,
          genres: genresResponse.genres,
          page: state.page,
        ),
      );
    } on DioException catch (e) {
      emit(
        HomeErrorState(
          error: e.error.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }

  /// Searches movies by text query.
  /// Resets or paginates results based on `reset` flag.
  void searchMovies(String query, {bool reset = false}) async {
    var searchRepo = getIt<SearchRepo>();
    try {
      final moviesResponse = await searchRepo.searchMovies(
        query: query,
        page: reset ? 1 : state.page + 1,
      );
      emit(
        HomeLoadedState(
          movies:
              reset
                  ? moviesResponse.results
                  : [...state.movies, ...moviesResponse.results],
          genres: state.genres,
          page: reset ? 1 : state.page + 1,
        ),
      );
    } on DioException catch (e) {
      emit(
        HomeErrorState(
          error: e.error.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }

  /// Searches tv shows by text query.
  /// Resets or paginates results based on `reset` flag.
  void searchTvShows(String query, {bool reset = false}) async {
    var searchRepo = getIt<SearchRepo>();
    try {
      final tvShowsResponse = await searchRepo.searchTvShows(
        query: query,
        page: reset ? 1 : state.page + 1,
      );
      emit(
        HomeLoadedState(
          movies:
              reset
                  ? tvShowsResponse.results
                  : [...state.movies, ...tvShowsResponse.results],
          genres: state.genres,
          page: reset ? 1 : state.page + 1,
        ),
      );
    } on DioException catch (e) {
      emit(
        HomeErrorState(
          error: e.error.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }
}
