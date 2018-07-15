// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movies_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBMoviesCollectionResponse _$TMDBMoviesCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return new TMDBMoviesCollectionResponse(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List)
          ?.map((e) => e == null
              ? null
              : new TMDBMovieBasic.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      errors: (json['errors'] as List)?.map((e) => e as String)?.toList());
}

abstract class _$TMDBMoviesCollectionResponseSerializerMixin {
  int get page;
  List<TMDBMovieBasic> get results;
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
