import 'package:json_annotation/json_annotation.dart';

part 'app_setting_model.g.dart';

@JsonSerializable()
class AppSettingModel {
  final String language;
  final String theme;

  AppSettingModel({this.language = 'en', this.theme = 'light'});

  factory AppSettingModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingModelToJson(this);
}
