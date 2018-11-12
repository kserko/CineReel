// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_reviews_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBReviewsResponse _$TMDBReviewsResponseFromJson(Map<String, dynamic> json) {
  return TMDBReviewsResponse(
      json['id'] as int,
      json['page'] as int,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : TMDBReview.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total_results'] as int)
    ..totalPages = json['total_pages'] as int;
}

Map<String, dynamic> _$TMDBReviewsResponseToJson(
        TMDBReviewsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults
    };

TMDBReview _$TMDBReviewFromJson(Map<String, dynamic> json) {
  return TMDBReview(json['author'] as String, json['content'] as String,
      json['id'] as String, json['url'] as String);
}

Map<String, dynamic> _$TMDBReviewToJson(TMDBReview instance) =>
    <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'id': instance.id,
      'url': instance.url
    };
