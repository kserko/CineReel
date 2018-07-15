// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'omdb_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OMDBMovie _$OMDBMovieFromJson(Map<String, dynamic> json) {
  return new OMDBMovie(
      json['title'] as String,
      json['year'] as String,
      json['rated'] as String,
      json['released'] as String,
      json['runtime'] as String,
      json['genre'] as String,
      json['director'] as String,
      json['writer'] as String,
      json['actors'] as String,
      json['plot'] as String,
      json['language'] as String,
      json['country'] as String,
      json['awards'] as String,
      json['poster'] as String,
      (json['ratings'] as List)
          ?.map((e) => e == null
              ? null
              : new OMDBRating.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['metascore'] as String,
      json['imdbRating'] as String,
      json['imdbVotes'] as String,
      json['imdbID'] as String,
      json['type'] as String,
      json['dVD'] as String,
      json['boxOffice'] as String,
      json['production'] as String,
      json['website'] as String,
      json['response'] as String);
}

abstract class _$OMDBMovieSerializerMixin {
  String get title;
  String get year;
  String get rated;
  String get released;
  String get runtime;
  String get genre;
  String get director;
  String get writer;
  String get actors;
  String get plot;
  String get language;
  String get country;
  String get awards;
  String get poster;
  List<OMDBRating> get ratings;
  String get metascore;
  String get imdbRating;
  String get imdbVotes;
  String get imdbID;
  String get type;
  String get dVD;
  String get boxOffice;
  String get production;
  String get website;
  String get response;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'year': year,
        'rated': rated,
        'released': released,
        'runtime': runtime,
        'genre': genre,
        'director': director,
        'writer': writer,
        'actors': actors,
        'plot': plot,
        'language': language,
        'country': country,
        'awards': awards,
        'poster': poster,
        'ratings': ratings,
        'metascore': metascore,
        'imdbRating': imdbRating,
        'imdbVotes': imdbVotes,
        'imdbID': imdbID,
        'type': type,
        'dVD': dVD,
        'boxOffice': boxOffice,
        'production': production,
        'website': website,
        'response': response
      };
}

OMDBRating _$OMDBRatingFromJson(Map<String, dynamic> json) {
  return new OMDBRating(json['source'] as String, json['value'] as String);
}

abstract class _$OMDBRatingSerializerMixin {
  String get source;
  String get value;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'source': source, 'value': value};
}
