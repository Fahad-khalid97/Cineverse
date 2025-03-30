import 'package:json_annotation/json_annotation.dart';

part 'account_details_model.g.dart';

@JsonSerializable()
class AccountDetailsModel {
  final int id;
  final String name;
  final String username;
  @JsonKey(name: 'include_adult')
  final bool includeAdult;
  @JsonKey(name: 'iso_639_1')
  final String language;
  @JsonKey(name: 'iso_3166_1')
  final String country;

  AccountDetailsModel({
    required this.id,
    required this.name,
    required this.username,
    required this.includeAdult,
    required this.language,
    required this.country,
  });

  factory AccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailsModelToJson(this);
}
