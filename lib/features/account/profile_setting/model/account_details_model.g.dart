// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailsModel _$AccountDetailsModelFromJson(Map<String, dynamic> json) =>
    AccountDetailsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      username: json['username'] as String,
      includeAdult: json['include_adult'] as bool,
      language: json['iso_639_1'] as String,
      country: json['iso_3166_1'] as String,
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountDetailsModelToJson(
        AccountDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'include_adult': instance.includeAdult,
      'iso_639_1': instance.language,
      'iso_3166_1': instance.country,
      'avatar': instance.avatar,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      gravatar: Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: TMDB.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'gravatar': instance.gravatar,
      'tmdb': instance.tmdb,
    };

Gravatar _$GravatarFromJson(Map<String, dynamic> json) => Gravatar(
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$GravatarToJson(Gravatar instance) => <String, dynamic>{
      'hash': instance.hash,
    };

TMDB _$TMDBFromJson(Map<String, dynamic> json) => TMDB(
      avatarPath: json['avatar_path'] as String?,
    );

Map<String, dynamic> _$TMDBToJson(TMDB instance) => <String, dynamic>{
      'avatar_path': instance.avatarPath,
    };
