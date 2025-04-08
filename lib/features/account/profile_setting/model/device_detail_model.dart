import 'package:json_annotation/json_annotation.dart';

part 'device_detail_model.g.dart';

@JsonSerializable()
class DeviceDetailModel {
  final String deviceModel;
  final String deviceOs;
  final String storage;
  final String battery;

  DeviceDetailModel({
    required this.deviceModel,
    required this.deviceOs,
    required this.storage,
    required this.battery,
  });

  factory DeviceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDetailModelToJson(this);
}
