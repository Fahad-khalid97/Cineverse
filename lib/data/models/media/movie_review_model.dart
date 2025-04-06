import 'package:json_annotation/json_annotation.dart';

part 'movie_review_model.g.dart';

@JsonSerializable()
class MovieReviewsResponse {
  final int id;
  final int page;
  final List<ReviewModel> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  MovieReviewsResponse({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieReviewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieReviewsResponseToJson(this);
}

@JsonSerializable()
class ReviewModel {
  final String id;
  final String author;
  @JsonKey(name: 'author_details')
  final AuthorDetailsModel authorDetails;
  final String content;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final String url;

  ReviewModel({
    required this.id,
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

@JsonSerializable()
class AuthorDetailsModel {
  final String name;
  final String username;
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;
  final double? rating;

  AuthorDetailsModel({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailsModelToJson(this);
}
