import 'package:json_annotation/json_annotation.dart';
import 'package:cineverse/core/api/api_constants.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int? id;
  final String? title;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final double? popularity;
  final bool? adult;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? name;
  final bool? video;

  MovieModel({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
    this.popularity,
    this.adult,
    this.originalLanguage,
    this.originalTitle,
    this.name,
    this.video,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  // Helper method to get the full poster URL
  String getPosterUrl([String size = 'w500']) {
    if (posterPath == null) return '';
    return '${ApiConstants.imageBaseUrl}$size$posterPath';
  }

  // Helper method to get the full backdrop URL
  String getBackdropUrl([String size = 'w780']) {
    if (backdropPath == null) return '';
    return '${ApiConstants.imageBaseUrl}$size$backdropPath';
  }
}
