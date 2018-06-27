// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoviesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) {
  return new MoviesResponse(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List)
          ?.map((e) =>
              e == null ? null : new Movie.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      errors: (json['errors'] as List)?.map((e) => e as String)?.toList());
}

abstract class _$MoviesResponseSerializerMixin {
  int get page;
  List<Movie> get results;
  int get totalResults;
  int get totalPages;
  List<String> get errors;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'results': results,
        'total_results': totalResults,
        'total_pages': totalPages,
        'errors': errors
      };
}
