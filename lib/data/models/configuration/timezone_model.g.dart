// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timezone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimezoneModel _$TimezoneModelFromJson(Map<String, dynamic> json) =>
    TimezoneModel(
      countryCode: json['iso_3166_1'] as String,
      zones: (json['zones'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TimezoneModelToJson(TimezoneModel instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.countryCode,
      'zones': instance.zones,
    };
