// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoviesResponse.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) =>
    new MoviesResponse(
        page: json['page'] as int,
        totalResults: json['total_results'] as int,
        totalPages: json['total_pages'] as int,
        results: (json['results'] as List)
            ?.map((e) => e == null
                ? null
                : new Movie.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$MoviesResponseSerializerMixin {
  int get page;
  List<Movie> get results;
  int get totalResults;
  int get totalPages;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'results': results,
        'total_results': totalResults,
        'total_pages': totalPages
      };
}
