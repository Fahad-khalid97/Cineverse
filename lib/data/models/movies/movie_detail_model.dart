// lib/data/models/movie/movie_details_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:cineverse/data/models/genre/genre_model.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
  final int id;
  final String title;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final List<GenreModel> genres;
  final int runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguageModel> spokenLanguages;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompanyModel> productionCompanies;
  final String status;
  final String tagline;
  final double popularity;
  final bool adult;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final bool video;
  final int? budget;
  final int? revenue;
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @JsonKey(name: 'belongs_to_collection')
  final CollectionModel? belongsToCollection;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.runtime,
    required this.spokenLanguages,
    required this.productionCompanies,
    required this.status,
    required this.tagline,
    required this.popularity,
    required this.adult,
    required this.originalLanguage,
    required this.originalTitle,
    required this.video,
    this.budget,
    this.revenue,
    this.imdbId,
    this.belongsToCollection,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}

@JsonSerializable()
class SpokenLanguageModel {
  @JsonKey(name: 'english_name')
  final String englishName;
  @JsonKey(name: 'iso_639_1')
  final String iso;
  final String name;

  SpokenLanguageModel({
    required this.englishName,
    required this.iso,
    required this.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}

@JsonSerializable()
class ProductionCompanyModel {
  final int id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  ProductionCompanyModel({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);
}

@JsonSerializable()
class CollectionModel {
  final int id;
  final String name;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  CollectionModel({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}
