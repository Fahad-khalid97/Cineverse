import 'package:cineverse/data/models/genre/genre_model.dart';
import 'package:cineverse/data/models/movies/movie_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
sealed class HomeState extends Equatable {
  final List<MovieModel> movies;
  final List<GenreModel> genres;

  const HomeState({required this.movies, required this.genres});
}

final class HomeInitial extends HomeState {
  const HomeInitial({required super.movies, required super.genres});

  @override
  List<Object?> get props => [movies, genres];
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState({required super.movies, required super.genres});

  @override
  List<Object?> get props => [movies, genres];
}

final class HomeLoadedState extends HomeState {
  final List<MovieModel> movies;

  const HomeLoadedState({required this.movies, required super.genres})
    : super(movies: movies);

  HomeLoadedState copyWith({
    List<MovieModel>? movies,
    List<GenreModel>? genres,
  }) {
    return HomeLoadedState(
      movies: movies ?? this.movies,
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [movies, genres];
}

final class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState({
    required this.error,
    required super.movies,
    required super.genres,
  });

  @override
  List<Object?> get props => [error, movies, genres];
}
