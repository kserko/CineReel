// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBMoviesResponse _$TMDBMoviesResponseFromJson(Map<String, dynamic> json) {
  return TMDBMoviesResponse(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List)
          ?.map((e) => e == null
              ? null
              : TMDBMovieBasic.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      errors: (json['errors'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$TMDBMoviesResponseToJson(TMDBMoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'errors': instance.errors
    };
