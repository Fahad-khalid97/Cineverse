// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      success: json['success'] as bool,
      expiresAt: json['expires_at'] as String,
      requestToken: json['request_token'] as String,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'expires_at': instance.expiresAt,
      'request_token': instance.requestToken,
    };
