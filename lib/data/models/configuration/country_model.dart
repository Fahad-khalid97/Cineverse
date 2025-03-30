import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  @JsonKey(name: 'iso_3166_1')
  final String iso;
  @JsonKey(name: 'english_name')
  final String englishName;

  CountryModel({required this.iso, required this.englishName});

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
