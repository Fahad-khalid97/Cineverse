import 'package:json_annotation/json_annotation.dart';

part 'auth_resp.g.dart';

@JsonSerializable()
class AuthResponse {
  final bool success;
  @JsonKey(name: 'expires_at')
  final String expiresAt;
  @JsonKey(name: 'request_token')
  final String requestToken;

  AuthResponse({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
