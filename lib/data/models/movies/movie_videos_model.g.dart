// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_videos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideosModel _$MovieVideosModelFromJson(Map<String, dynamic> json) =>
    MovieVideosModel(
      id: (json['id'] as num).toInt(),
      results:
          (json['results'] as List<dynamic>)
              .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MovieVideosModelToJson(MovieVideosModel instance) =>
    <String, dynamic>{'id': instance.id, 'results': instance.results};

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
  id: json['id'] as String,
  name: json['name'] as String,
  key: json['key'] as String,
  site: json['site'] as String,
  type: json['type'] as String,
  official: json['official'] as bool,
  publishedAt: json['published_at'] as String,
  iso639: json['iso_639_1'] as String,
  iso3166: json['iso_3166_1'] as String,
);

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
      'iso_639_1': instance.iso639,
      'iso_3166_1': instance.iso3166,
    };
