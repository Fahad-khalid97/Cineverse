import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel {
  @JsonKey(name: 'iso_639_1')
  final String iso;
  @JsonKey(name: 'english_name')
  final String englishName;
  final String name;

  LanguageModel({
    required this.iso,
    required this.englishName,
    required this.name,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}
