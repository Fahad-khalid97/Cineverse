import 'package:cineverse/data/models/media/movie_detail_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:cineverse/data/models/media/movie_review_model.dart';
import 'package:cineverse/data/models/media/movie_credit_model.dart';

@immutable
sealed class MovieDetailState extends Equatable {
  final MovieDetailsModel movie;
  final List<ReviewModel> reviews;
  final double? rating;
  final List<CastModel> cast;
  final List<CrewModel> crew;
  final List<AuthorDetailsModel> authorDetails;

  const MovieDetailState({
    required this.movie,
    required this.reviews,
    required this.authorDetails,
    required this.cast,
    required this.crew,
    required this.rating,
  });

  @override
  List<Object?> get props => [
    movie,
    reviews,
    authorDetails,
    rating,
    cast,
    crew,
  ];
}

final class MovieDetailInitial extends MovieDetailState {
  const MovieDetailInitial({
    required super.movie,
    required super.reviews,
    required super.authorDetails,
    required super.cast,
    required super.crew,
    required super.rating,
  });

  @override
  List<Object?> get props => [
    movie,
    reviews,
    authorDetails,
    rating,
    cast,
    crew,
  ];
}

final class MovieDetailLoading extends MovieDetailState {
  const MovieDetailLoading({
    required super.movie,
    required super.reviews,
    required super.authorDetails,
    required super.cast,
    required super.crew,
    required super.rating,
  });

  @override
  List<Object?> get props => [
    movie,
    reviews,
    authorDetails,
    rating,
    cast,
    crew,
  ];
}

final class MovieDetailLoaded extends MovieDetailState {
  const MovieDetailLoaded({
    required super.movie,
    required super.reviews,
    required super.authorDetails,
    required super.cast,
    required super.crew,
    required super.rating,
  });

  @override
  List<Object?> get props => [
    movie,
    reviews,
    authorDetails,
    rating,
    cast,
    crew,
  ];
}

final class MovieDetailError extends MovieDetailState {
  final String error;
  const MovieDetailError({
    required super.movie,
    required super.reviews,
    required super.authorDetails,
    required super.cast,
    required super.crew,
    required super.rating,
    required this.error,
  });

  @override
  List<Object?> get props => [
    movie,
    reviews,
    authorDetails,
    rating,
    cast,
    crew,
    error,
  ];
}
