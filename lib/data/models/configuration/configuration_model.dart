import 'package:json_annotation/json_annotation.dart';

part 'configuration_model.g.dart';

@JsonSerializable()
class ConfigurationModel {
  final ImagesConfigModel images;
  @JsonKey(name: 'change_keys')
  final List<String> changeKeys;

  ConfigurationModel({required this.images, required this.changeKeys});

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationModelToJson(this);
}

@JsonSerializable()
class ImagesConfigModel {
  @JsonKey(name: 'base_url')
  final String baseUrl;
  @JsonKey(name: 'secure_base_url')
  final String secureBaseUrl;
  @JsonKey(name: 'backdrop_sizes')
  final List<String> backdropSizes;
  @JsonKey(name: 'logo_sizes')
  final List<String> logoSizes;
  @JsonKey(name: 'poster_sizes')
  final List<String> posterSizes;
  @JsonKey(name: 'profile_sizes')
  final List<String> profileSizes;
  @JsonKey(name: 'still_sizes')
  final List<String> stillSizes;

  ImagesConfigModel({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.logoSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.stillSizes,
  });

  factory ImagesConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesConfigModelToJson(this);
}
