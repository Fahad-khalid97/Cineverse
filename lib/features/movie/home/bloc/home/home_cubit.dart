import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cineverse/data/repo/search_repo.dart';
import 'home_state.dart';
import 'package:cineverse/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/data/models/genre/genre_model.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial(movies: [], genres: [], page: 0));

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
    } catch (e) {
      emit(
        HomeErrorState(
          error: e.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }

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
    } catch (e) {
      emit(
        HomeErrorState(
          error: e.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }

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
    } catch (e) {
      emit(
        HomeErrorState(
          error: e.toString(),
          movies: state.movies,
          genres: state.genres,
          page: state.page,
        ),
      );
    }
  }
}
