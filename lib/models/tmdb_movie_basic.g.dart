// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie_basic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBMovieBasic _$TMDBMovieBasicFromJson(Map<String, dynamic> json) {
  return TMDBMovieBasic(
      voteCount: json['vote_count'] as int,
      id: json['id'] as int,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num)?.toDouble(),
      title: json['title'] as String,
      popularity: (json['popularity'] as num)?.toDouble(),
      posterPath: json['poster_path'] as String,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
      backdropPath: json['backdrop_path'] as String,
      adult: json['adult'] as bool,
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String);
}

Map<String, dynamic> _$TMDBMovieBasicToJson(TMDBMovieBasic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'title': instance.title,
      'popularity': instance.popularity,
      'adult': instance.adult,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'backdrop_path': instance.backdropPath
    };
