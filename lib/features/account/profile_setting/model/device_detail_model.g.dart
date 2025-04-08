// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDetailModel _$DeviceDetailModelFromJson(Map<String, dynamic> json) =>
    DeviceDetailModel(
      deviceModel: json['deviceModel'] as String,
      deviceOs: json['deviceOs'] as String,
      storage: json['storage'] as String,
      battery: json['battery'] as String,
    );

Map<String, dynamic> _$DeviceDetailModelToJson(DeviceDetailModel instance) =>
    <String, dynamic>{
      'deviceModel': instance.deviceModel,
      'deviceOs': instance.deviceOs,
      'storage': instance.storage,
      'battery': instance.battery,
    };
