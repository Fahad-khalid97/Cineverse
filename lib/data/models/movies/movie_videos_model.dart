import 'package:json_annotation/json_annotation.dart';

part 'movie_videos_model.g.dart';

@JsonSerializable()
class MovieVideosModel {
  final int id;
  final List<VideoModel> results;

  MovieVideosModel({required this.id, required this.results});

  factory MovieVideosModel.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideosModelToJson(this);
}

@JsonSerializable()
class VideoModel {
  final String id;
  final String name;
  final String key;
  final String site;
  final String type;
  final bool official;
  @JsonKey(name: 'published_at')
  final String publishedAt;
  @JsonKey(name: 'iso_639_1')
  final String iso639;
  @JsonKey(name: 'iso_3166_1')
  final String iso3166;

  VideoModel({
    required this.id,
    required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.iso639,
    required this.iso3166,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
