// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_genres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBGenresResponse _$TMDBGenresResponseFromJson(Map<String, dynamic> json) {
  return new TMDBGenresResponse((json['genres'] as List)
      ?.map((e) => e == null ? null : new TMDBGenre.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

abstract class _$TMDBGenresResponseSerializerMixin {
  List<TMDBGenre> get genres;
  Map<String, dynamic> toJson() => <String, dynamic>{'genres': genres};
}

TMDBGenre _$TMDBGenreFromJson(Map<String, dynamic> json) {
  return new TMDBGenre(json['id'] as int, json['name'] as String);
}

abstract class _$TMDBGenreSerializerMixin {
  int get id;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{'id': id, 'name': name};
}
