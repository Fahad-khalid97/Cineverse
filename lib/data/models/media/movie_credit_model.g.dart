// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCreditsModel _$MovieCreditsModelFromJson(Map<String, dynamic> json) =>
    MovieCreditsModel(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCreditsModelToJson(MovieCreditsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };

CastModel _$CastModelFromJson(Map<String, dynamic> json) => CastModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      character: json['character'] as String,
      profilePath: json['profile_path'] as String?,
      order: (json['order'] as num).toInt(),
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      creditId: json['credit_id'] as String,
      adult: json['adult'] as bool,
    );

Map<String, dynamic> _$CastModelToJson(CastModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'character': instance.character,
      'profile_path': instance.profilePath,
      'order': instance.order,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'credit_id': instance.creditId,
      'adult': instance.adult,
    };

CrewModel _$CrewModelFromJson(Map<String, dynamic> json) => CrewModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      department: json['department'] as String,
      job: json['job'] as String,
      profilePath: json['profile_path'] as String?,
      gender: (json['gender'] as num).toInt(),
      knownForDepartment: json['known_for_department'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      creditId: json['credit_id'] as String,
      adult: json['adult'] as bool,
    );

Map<String, dynamic> _$CrewModelToJson(CrewModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'department': instance.department,
      'job': instance.job,
      'profile_path': instance.profilePath,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'credit_id': instance.creditId,
      'adult': instance.adult,
    };
