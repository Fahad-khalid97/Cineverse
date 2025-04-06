import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cineverse/data/repo/media_repo.dart';
import 'package:cineverse/di/di.dart';
import 'my_list_state.dart';

class MyListCubit extends Cubit<MyListState> {
  MyListCubit()
    : super(
        MyListLoadedState(
          popularMovies: [],
          topRatedMovies: [],
          nowPlaying: [],
          upcomingMovies: [],
          popularPage: 0,
          topRatedPage: 0,
          nowPlayingPage: 0,
          upcomingPage: 0,
        ),
      );
  Future<void> loadPopularMovies() async {
    final mediaRepo = getIt<MediaRepo>();
    try {
      final popularMovies = await mediaRepo.getPopularMovies(
        page: state.popularPage + 1,
      );
      emit(
        (state as MyListLoadedState).copyWith(
          popularMovies: [...state.popularMovies, ...popularMovies.results],
          popularPage: state.popularPage + 1,
        ),
      );
    } catch (error) {
      emit(
        MyListError(
          error: error.toString(),
          popularMovies: state.popularMovies,
          topRatedMovies: state.topRatedMovies,
          nowPlaying: state.nowPlaying,
          upcomingMovies: state.upcomingMovies,
          popularPage: state.popularPage,
          topRatedPage: state.topRatedPage,
          nowPlayingPage: state.nowPlayingPage,
          upcomingPage: state.upcomingPage,
        ),
      );
    }
  }

  Future<void> loadTopRatedMovies() async {
    final mediaRepo = getIt<MediaRepo>();
    try {
      final topRatedMovies = await mediaRepo.getTopRatedMovies(
        page: state.topRatedPage + 1,
      );
      emit(
        (state as MyListLoadedState).copyWith(
          topRatedMovies: [...state.topRatedMovies, ...topRatedMovies.results],
          topRatedPage: state.topRatedPage + 1,
        ),
      );
    } catch (error) {
      emit(
        MyListError(
          error: error.toString(),
          popularMovies: state.popularMovies,
          topRatedMovies: state.topRatedMovies,
          nowPlaying: state.nowPlaying,
          upcomingMovies: state.upcomingMovies,
          popularPage: state.popularPage,
          topRatedPage: state.topRatedPage,
          nowPlayingPage: state.nowPlayingPage,
          upcomingPage: state.upcomingPage,
        ),
      );
    }
  }

  Future<void> loadNowPlayingMovies() async {
    final mediaRepo = getIt<MediaRepo>();
    try {
      final nowPlayingMovies = await mediaRepo.getNowPlayingMovies(
        page: state.nowPlayingPage + 1,
      );
      emit(
        (state as MyListLoadedState).copyWith(
          nowPlaying: [...state.nowPlaying, ...nowPlayingMovies.results],
          nowPlayingPage: state.nowPlayingPage + 1,
        ),
      );
    } catch (error) {
      emit(
        MyListError(
          error: error.toString(),
          popularMovies: state.popularMovies,
          topRatedMovies: state.topRatedMovies,
          nowPlaying: state.nowPlaying,
          upcomingMovies: state.upcomingMovies,
          popularPage: state.popularPage,
          topRatedPage: state.topRatedPage,
          nowPlayingPage: state.nowPlayingPage,
          upcomingPage: state.upcomingPage,
        ),
      );
    }
  }

  Future<void> loadUpcomingMovies() async {
    final mediaRepo = getIt<MediaRepo>();
    try {
      final upcomingMovies = await mediaRepo.getUpcomingMovies(
        page: state.upcomingPage + 1,
      );
      emit(
        (state as MyListLoadedState).copyWith(
          upcomingMovies: [...state.upcomingMovies, ...upcomingMovies.results],
          upcomingPage: state.upcomingPage + 1,
        ),
      );
    } catch (error) {
      emit(
        MyListError(
          error: error.toString(),
          popularMovies: state.popularMovies,
          topRatedMovies: state.topRatedMovies,
          nowPlaying: state.nowPlaying,
          upcomingMovies: state.upcomingMovies,
          popularPage: state.popularPage,
          topRatedPage: state.topRatedPage,
          nowPlayingPage: state.nowPlayingPage,
          upcomingPage: state.upcomingPage,
        ),
      );
    }
  }
}
