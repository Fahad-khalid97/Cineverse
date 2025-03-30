// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreListResponse _$GenreListResponseFromJson(Map<String, dynamic> json) =>
    GenreListResponse(
      genres:
          (json['genres'] as List<dynamic>)
              .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GenreListResponseToJson(GenreListResponse instance) =>
    <String, dynamic>{'genres': instance.genres};
