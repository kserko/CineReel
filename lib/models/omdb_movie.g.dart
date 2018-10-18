// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'omdb_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OMDBMovie _$OMDBMovieFromJson(Map<String, dynamic> json) {
  return new OMDBMovie(
      json['Title'] as String,
      json['Year'] as String,
      json['Rated'] as String,
      json['Released'] as String,
      json['Runtime'] as String,
      json['Genre'] as String,
      json['Director'] as String,
      json['Writer'] as String,
      json['Actors'] as String,
      json['Plot'] as String,
      json['Language'] as String,
      json['Country'] as String,
      json['Awards'] as String,
      json['Poster'] as String,
      (json['Ratings'] as List)
          ?.map((e) => e == null ? null : new OMDBRating.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['Metascore'] as String,
      json['imdbRating'] as String,
      json['imdbVotes'] as String,
      json['imdbID'] as String,
      json['Type'] as String,
      json['DVD'] as String,
      json['BoxOffice'] as String,
      json['Production'] as String,
      json['Website'] as String,
      json['Response'] as String);
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
  String get dvd;
  String get boxOffice;
  String get production;
  String get website;
  String get response;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Title': title,
        'Year': year,
        'Rated': rated,
        'Released': released,
        'Runtime': runtime,
        'Genre': genre,
        'Director': director,
        'Writer': writer,
        'Actors': actors,
        'Plot': plot,
        'Language': language,
        'Country': country,
        'Awards': awards,
        'Poster': poster,
        'Ratings': ratings,
        'Metascore': metascore,
        'imdbRating': imdbRating,
        'imdbVotes': imdbVotes,
        'imdbID': imdbID,
        'Type': type,
        'DVD': dvd,
        'BoxOffice': boxOffice,
        'Production': production,
        'Website': website,
        'Response': response
      };
}

OMDBRating _$OMDBRatingFromJson(Map<String, dynamic> json) {
  return new OMDBRating(json['Source'] as String, json['Value'] as String);
}

abstract class _$OMDBRatingSerializerMixin {
  String get source;
  String get value;
  Map<String, dynamic> toJson() => <String, dynamic>{'Source': source, 'Value': value};
}
