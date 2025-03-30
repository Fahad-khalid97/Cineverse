// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      iso: json['iso_639_1'] as String,
      englishName: json['english_name'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso,
      'english_name': instance.englishName,
      'name': instance.name,
    };
