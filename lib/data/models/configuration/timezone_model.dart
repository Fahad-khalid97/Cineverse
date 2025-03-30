import 'package:json_annotation/json_annotation.dart';

part 'timezone_model.g.dart';

@JsonSerializable()
class TimezoneModel {
  @JsonKey(name: 'iso_3166_1')
  final String countryCode;
  final List<String> zones;

  TimezoneModel({required this.countryCode, required this.zones});

  factory TimezoneModel.fromJson(Map<String, dynamic> json) =>
      _$TimezoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimezoneModelToJson(this);
}
