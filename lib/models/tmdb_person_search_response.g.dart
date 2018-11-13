// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_person_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBPersonSearchResponse _$TMDBPersonSearchResponseFromJson(
    Map<String, dynamic> json) {
  return TMDBPersonSearchResponse(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List)
          ?.map((e) => e == null
              ? null
              : TMDBPersonBasic.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..errors = (json['errors'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$TMDBPersonSearchResponseToJson(
        TMDBPersonSearchResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
      'errors': instance.errors
    };

TMDBPersonBasic _$TMDBPersonBasicFromJson(Map<String, dynamic> json) {
  return TMDBPersonBasic(
      popularity: (json['popularity'] as num)?.toDouble(),
      id: json['id'] as int,
      profilePath: json['profile_path'] as String,
      name: json['name'] as String);
}

Map<String, dynamic> _$TMDBPersonBasicToJson(TMDBPersonBasic instance) =>
    <String, dynamic>{
      'name': instance.name,
      'popularity': instance.popularity,
      'id': instance.id,
      'profile_path': instance.profilePath
    };
