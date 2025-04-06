import 'package:json_annotation/json_annotation.dart';
import 'package:cineverse/core/api/api_constants.dart';
part 'movie_credit_model.g.dart';

@JsonSerializable()
class MovieCreditsModel {
  final int id;
  final List<CastModel> cast;
  final List<CrewModel> crew;

  MovieCreditsModel({required this.id, required this.cast, required this.crew});

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsModelToJson(this);
}

@JsonSerializable()
class CastModel {
  final int id;
  final String name;
  final String character;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final int order;
  final int gender;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @JsonKey(name: 'original_name')
  final String originalName;
  final double popularity;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final bool adult;

  CastModel({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
    required this.order,
    required this.gender,
    required this.knownForDepartment,
    required this.originalName,
    required this.popularity,
    required this.creditId,
    required this.adult,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);

  @JsonKey(ignore: true)
  String get getPosterUrl {
    if (profilePath == null) return '';
    return '${ApiConstants.imageBaseUrl}w500$profilePath';
  }
}

@JsonSerializable()
class CrewModel {
  final int id;
  final String name;
  final String department;
  final String job;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final int gender;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @JsonKey(name: 'original_name')
  final String originalName;
  final double popularity;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final bool adult;

  CrewModel({
    required this.id,
    required this.name,
    required this.department,
    required this.job,
    this.profilePath,
    required this.gender,
    required this.knownForDepartment,
    required this.originalName,
    required this.popularity,
    required this.creditId,
    required this.adult,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) =>
      _$CrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewModelToJson(this);

  @JsonKey(ignore: true)
  String get getPosterUrl {
    if (profilePath == null) return '';
    return '${ApiConstants.imageBaseUrl}w500$profilePath';
  }
}
