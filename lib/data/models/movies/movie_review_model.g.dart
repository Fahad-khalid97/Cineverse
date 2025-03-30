// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieReviewsResponse _$MovieReviewsResponseFromJson(
  Map<String, dynamic> json,
) => MovieReviewsResponse(
  id: (json['id'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  results:
      (json['results'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPages: (json['total_pages'] as num).toInt(),
  totalResults: (json['total_results'] as num).toInt(),
);

Map<String, dynamic> _$MovieReviewsResponseToJson(
  MovieReviewsResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'page': instance.page,
  'results': instance.results,
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: json['id'] as String,
  author: json['author'] as String,
  authorDetails: AuthorDetailsModel.fromJson(
    json['author_details'] as Map<String, dynamic>,
  ),
  content: json['content'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'author_details': instance.authorDetails,
      'content': instance.content,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'url': instance.url,
    };

AuthorDetailsModel _$AuthorDetailsModelFromJson(Map<String, dynamic> json) =>
    AuthorDetailsModel(
      name: json['name'] as String,
      username: json['username'] as String,
      avatarPath: json['avatar_path'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AuthorDetailsModelToJson(AuthorDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
