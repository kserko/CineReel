// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_genres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBGenresResponse _$TMDBGenresResponseFromJson(Map<String, dynamic> json) {
  return TMDBGenresResponse((json['genres'] as List)
      ?.map((e) =>
          e == null ? null : TMDBGenre.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$TMDBGenresResponseToJson(TMDBGenresResponse instance) =>
    <String, dynamic>{'genres': instance.genres};

TMDBGenre _$TMDBGenreFromJson(Map<String, dynamic> json) {
  return TMDBGenre(json['id'] as int, json['name'] as String);
}

Map<String, dynamic> _$TMDBGenreToJson(TMDBGenre instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
