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
    );

Map<String, dynamic> _$AccountDetailsModelToJson(
  AccountDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'include_adult': instance.includeAdult,
  'iso_639_1': instance.language,
  'iso_3166_1': instance.country,
};
