import 'package:cineverse/data/models/media/movie_model.dart';
import 'package:equatable/equatable.dart';

sealed class MyListState extends Equatable {
  final List<MovieModel> popularMovies;
  final List<MovieModel> topRatedMovies;
  final List<MovieModel> nowPlaying;
  final List<MovieModel> upcomingMovies;
  final int popularPage;
  final int topRatedPage;
  final int nowPlayingPage;
  final int upcomingPage;

  const MyListState({
    required this.popularMovies,
    required this.topRatedMovies,
    required this.nowPlaying,
    required this.upcomingMovies,
    required this.popularPage,
    required this.topRatedPage,
    required this.nowPlayingPage,
    required this.upcomingPage,
  });
}

final class MyListInitial extends MyListState {
  const MyListInitial({
    required super.popularMovies,
    required super.topRatedMovies,
    required super.nowPlaying,
    required super.upcomingMovies,
    required super.popularPage,
    required super.topRatedPage,
    required super.nowPlayingPage,
    required super.upcomingPage,
  });

  @override
  List<Object?> get props => [
    popularMovies,
    topRatedMovies,
    nowPlaying,
    upcomingMovies,
  ];
}

final class MyListLoading extends MyListState {
  const MyListLoading({
    required super.popularMovies,
    required super.topRatedMovies,
    required super.nowPlaying,
    required super.upcomingMovies,
    required super.popularPage,
    required super.topRatedPage,
    required super.nowPlayingPage,
    required super.upcomingPage,
  });

  @override
  List<Object?> get props => [
    popularMovies,
    topRatedMovies,
    nowPlaying,
    upcomingMovies,
  ];
}

final class MyListLoadedState extends MyListState {
  const MyListLoadedState({
    required super.popularMovies,
    required super.topRatedMovies,
    required super.nowPlaying,
    required super.upcomingMovies,
    required super.popularPage,
    required super.topRatedPage,
    required super.nowPlayingPage,
    required super.upcomingPage,
  });
  MyListLoadedState copyWith({
    List<MovieModel>? popularMovies,
    List<MovieModel>? topRatedMovies,
    List<MovieModel>? nowPlaying,
    List<MovieModel>? upcomingMovies,
    int? popularPage,
    int? topRatedPage,
    int? nowPlayingPage,
    int? upcomingPage,
  }) {
    return MyListLoadedState(
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      nowPlaying: nowPlaying ?? this.nowPlaying,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      popularPage: popularPage ?? this.popularPage,
      topRatedPage: topRatedPage ?? this.topRatedPage,
      nowPlayingPage: nowPlayingPage ?? this.nowPlayingPage,
      upcomingPage: upcomingPage ?? this.upcomingPage,
    );
  }

  @override
  List<Object?> get props => [
    popularMovies,
    topRatedMovies,
    nowPlaying,
    upcomingMovies,
  ];
}

final class MyListError extends MyListState {
  final String error;
  const MyListError({
    required this.error,
    required super.popularMovies,
    required super.topRatedMovies,
    required super.nowPlaying,
    required super.upcomingMovies,
    required super.popularPage,
    required super.topRatedPage,
    required super.nowPlayingPage,
    required super.upcomingPage,
  });

  @override
  List<Object?> get props => [
    popularMovies,
    topRatedMovies,
    nowPlaying,
    upcomingMovies,
    error,
    popularPage,
    topRatedPage,
    nowPlayingPage,
    upcomingPage,
  ];
}
