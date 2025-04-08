// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingModel _$AppSettingModelFromJson(Map<String, dynamic> json) =>
    AppSettingModel(
      language: json['language'] as String? ?? 'en',
      theme: json['theme'] as String? ?? 'light',
    );

Map<String, dynamic> _$AppSettingModelToJson(AppSettingModel instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': instance.theme,
    };
