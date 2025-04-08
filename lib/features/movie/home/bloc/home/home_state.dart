import 'package:cineverse/data/models/genre/genre_model.dart';
import 'package:cineverse/data/models/media/movie_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
sealed class HomeState extends Equatable {
  final List<MovieModel> movies;
  final List<GenreModel> genres;
  final int page;
  const HomeState({
    required this.movies,
    required this.genres,
    required this.page,
  });
}

final class HomeInitial extends HomeState {
  const HomeInitial({
    required super.movies,
    required super.genres,
    required super.page,
  });

  @override
  List<Object?> get props => [movies, genres, page];
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState({
    required super.movies,
    required super.genres,
    required super.page,
  });

  @override
  List<Object?> get props => [movies, genres, page];
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required super.movies,
    required super.genres,
    required super.page,
  });

  HomeLoadedState copyWith({
    List<MovieModel>? movies,
    List<GenreModel>? genres,
    int? page,
  }) {
    return HomeLoadedState(
      movies: movies ?? this.movies,
      genres: genres ?? this.genres,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [movies, genres, page];
}

final class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState({
    required this.error,
    required super.movies,
    required super.genres,
    required super.page,
  });

  @override
  List<Object?> get props => [error, movies, genres, page];
}
