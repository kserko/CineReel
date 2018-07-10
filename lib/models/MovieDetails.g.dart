// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) {
  return new MovieDetails(
      json['adult'] as bool,
      json['backdropPath'] as String,
      json['belongsToCollection'],
      json['budget'] as int,
      (json['genres'] as List)
          ?.map((e) =>
              e == null ? null : new Genre.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['homepage'],
      json['id'] as int,
      json['imdbId'] as String,
      json['originalLanguage'] as String,
      json['originalTitle'] as String,
      json['overview'] as String,
      (json['popularity'] as num)?.toDouble(),
      json['posterPath'] as String,
      (json['productionCompanies'] as List)
          ?.map((e) => e == null
              ? null
              : new ProductionCompany.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['productionCountries'] as List)
          ?.map((e) => e == null
              ? null
              : new ProductionCountry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['releaseDate'] as String,
      json['revenue'] as int,
      json['runtime'] as int,
      (json['spokenLanguages'] as List)
          ?.map((e) => e == null
              ? null
              : new SpokenLanguage.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['status'] as String,
      json['tagline'] as String,
      json['title'] as String,
      json['video'] as bool,
      (json['voteAverage'] as num)?.toDouble(),
      json['voteCount'] as int,
      json['status_message'] as String);
}

abstract class _$MovieDetailsSerializerMixin {
  String get status_message;
  bool get adult;
  String get backdropPath;
  Object get belongsToCollection;
  int get budget;
  List<Genre> get genres;
  Object get homepage;
  int get id;
  String get imdbId;
  String get originalLanguage;
  String get originalTitle;
  String get overview;
  double get popularity;
  String get posterPath;
  List<ProductionCompany> get productionCompanies;
  List<ProductionCountry> get productionCountries;
  String get releaseDate;
  int get revenue;
  int get runtime;
  List<SpokenLanguage> get spokenLanguages;
  String get status;
  String get tagline;
  String get title;
  bool get video;
  double get voteAverage;
  int get voteCount;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'status_message': status_message,
        'adult': adult,
        'backdropPath': backdropPath,
        'belongsToCollection': belongsToCollection,
        'budget': budget,
        'genres': genres,
        'homepage': homepage,
        'id': id,
        'imdbId': imdbId,
        'originalLanguage': originalLanguage,
        'originalTitle': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'posterPath': posterPath,
        'productionCompanies': productionCompanies,
        'productionCountries': productionCountries,
        'releaseDate': releaseDate,
        'revenue': revenue,
        'runtime': runtime,
        'spokenLanguages': spokenLanguages,
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'voteAverage': voteAverage,
        'voteCount': voteCount
      };
}

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return new ProductionCompany(json['id'] as int, json['logoPath'],
      json['name'] as String, json['originCountry'] as String);
}

abstract class _$ProductionCompanySerializerMixin {
  int get id;
  Object get logoPath;
  String get name;
  String get originCountry;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'logoPath': logoPath,
        'name': name,
        'originCountry': originCountry
      };
}

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return new ProductionCountry(
      json['iso31661'] as String, json['name'] as String);
}

abstract class _$ProductionCountrySerializerMixin {
  String get iso31661;
  String get name;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'iso31661': iso31661, 'name': name};
}

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return new SpokenLanguage(json['iso6391'] as String, json['name'] as String);
}

abstract class _$SpokenLanguageSerializerMixin {
  String get iso6391;
  String get name;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'iso6391': iso6391, 'name': name};
}

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return new Genre(json['id'] as int, json['name'] as String);
}

abstract class _$GenreSerializerMixin {
  int get id;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{'id': id, 'name': name};
}
