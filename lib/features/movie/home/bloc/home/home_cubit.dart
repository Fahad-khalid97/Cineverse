import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cineverse/data/repo/search_repo.dart';
import 'home_state.dart';
import 'package:cineverse/di/di.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial(movies: [], genres: []));

  void loadMovies() async {
    var searchRepo = getIt<SearchRepo>();
    try {
      emit(HomeLoadingState(movies: state.movies, genres: state.genres));
      final genresResponse = await searchRepo.getMovieGenres();
      final moviesResponse = await searchRepo.discoverMovies();

      emit(
        HomeLoadedState(
          movies: moviesResponse.results,
          genres: genresResponse.genres,
        ),
      );
    } catch (e) {
      emit(
        HomeErrorState(
          error: e.toString(),
          movies: state.movies,
          genres: state.genres,
        ),
      );
    }
  }
}
