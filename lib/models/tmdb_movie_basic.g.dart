// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie_basic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBMovieBasic _$TMDBMovieBasicFromJson(Map<String, dynamic> json) {
  return new TMDBMovieBasic(
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

abstract class _$TMDBMovieBasicSerializerMixin {
  int get id;
  bool get video;
  String get title;
  double get popularity;
  bool get adult;
  String get overview;
  String get posterPath;
  String get releaseDate;
  int get voteCount;
  double get voteAverage;
  String get originalLanguage;
  String get originalTitle;
  List<int> get genreIds;
  String get backdropPath;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'video': video,
        'title': title,
        'popularity': popularity,
        'adult': adult,
        'overview': overview,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'genre_ids': genreIds,
        'backdrop_path': backdropPath
      };
}
