// lib/data/models/movie/movie_details_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:cineverse/data/models/genre/genre_model.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailsModel {
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
  final List<GenreModel>? genres;
  final int? runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguageModel>? spokenLanguages;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompanyModel>? productionCompanies;
  final String? status;
  final String? tagline;
  final double? popularity;
  final bool? adult;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final bool? video;
  final int? budget;
  final int? revenue;
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @JsonKey(name: 'belongs_to_collection')
  final CollectionModel? belongsToCollection;

  MovieDetailsModel({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genres,
    this.runtime,
    this.spokenLanguages,
    this.productionCompanies,
    this.status,
    this.tagline,
    this.popularity,
    this.adult,
    this.originalLanguage,
    this.originalTitle,
    this.video,
    this.budget,
    this.revenue,
    this.imdbId,
    this.belongsToCollection,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);

  @JsonKey(ignore: true)
  String get formattedRuntime {
    if (runtime == null || runtime == 0) return 'N/A';
    final hours = runtime! ~/ 60;
    final minutes = runtime! % 60;
    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${minutes}m';
    }
  }

  @JsonKey(ignore: true)
  String get ratingOutOfFiveFormatted =>
      ((voteAverage ?? 0) / 2).toStringAsFixed(1);

  @JsonKey(ignore: true)
  String get formattedVoteCount {
    if (voteCount! >= 1000) {
      return '${(voteCount! / 1000).toStringAsFixed(0)}k';
    } else if (voteCount! >= 1000000) {
      return '${(voteCount! / 1000000).toStringAsFixed(0)}M';
    } else {
      return voteCount.toString();
    }
  }
}

@JsonSerializable()
class SpokenLanguageModel {
  @JsonKey(name: 'english_name')
  final String? englishName;
  @JsonKey(name: 'iso_639_1')
  final String? iso;
  final String? name;

  SpokenLanguageModel({this.englishName, this.iso, this.name});

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}

@JsonSerializable()
class ProductionCompanyModel {
  final int? id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  final String? name;
  @JsonKey(name: 'origin_country')
  final String? originCountry;

  ProductionCompanyModel({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);
}

@JsonSerializable()
class CollectionModel {
  final int? id;
  final String? name;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  CollectionModel({this.id, this.name, this.posterPath, this.backdropPath});

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}
