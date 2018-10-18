// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_reviews_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBReviewsResponse _$TMDBReviewsResponseFromJson(Map<String, dynamic> json) {
  return new TMDBReviewsResponse(
      json['id'] as int,
      json['page'] as int,
      (json['results'] as List)
          ?.map((e) => e == null ? null : new TMDBReview.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total_results'] as int)
    ..totalPages = json['total_pages'] as int;
}

abstract class _$TMDBReviewsResponseSerializerMixin {
  int get id;
  int get page;
  List<TMDBReview> get results;
  int get totalPages;
  int get totalResults;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'page': page,
        'results': results,
        'total_pages': totalPages,
        'total_results': totalResults
      };
}

TMDBReview _$TMDBReviewFromJson(Map<String, dynamic> json) {
  return new TMDBReview(json['author'] as String, json['content'] as String, json['id'] as String,
      json['url'] as String);
}

abstract class _$TMDBReviewSerializerMixin {
  String get author;
  String get content;
  String get id;
  String get url;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'author': author, 'content': content, 'id': id, 'url': url};
}
