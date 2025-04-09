import 'package:json_annotation/json_annotation.dart';

part 'session_delete_model.g.dart';

@JsonSerializable()
class DeleteSessionResponse {
  final bool success;

  DeleteSessionResponse({required this.success});

  factory DeleteSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteSessionResponseToJson(this);
}
