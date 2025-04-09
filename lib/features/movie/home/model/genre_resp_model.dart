import 'package:json_annotation/json_annotation.dart';
import 'package:cineverse/data/models/genre/genre_model.dart';

part 'genre_resp_model.g.dart';

@JsonSerializable()
class GenreListResponse {
  final List<GenreModel> genres;

  GenreListResponse({required this.genres});

  factory GenreListResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListResponseToJson(this);
}
