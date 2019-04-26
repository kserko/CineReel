// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_multi_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBMultiSearchResponse _$TMDBMultiSearchResponseFromJson(
    Map<String, dynamic> json) {
  return TMDBMultiSearchResponse(
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List)
          ?.map((e) => e == null
              ? null
              : TMDBMultiSearchResult.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TMDBMultiSearchResponseToJson(
        TMDBMultiSearchResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results
    };

TMDBMultiSearchResult _$TMDBMultiSearchResultFromJson(
    Map<String, dynamic> json) {
  return TMDBMultiSearchResult(
      voteAverage: (json['vote_average'] as num)?.toDouble(),
      voteCount: json['vote_count'] as int,
      id: json['id'] as int,
      video: json['video'] as bool,
      mediaType: json['media_type'] as String,
      title: json['title'] as String,
      popularity: (json['popularity'] as num)?.toDouble(),
      posterPath: json['poster_path'] as String,
      originalLanguage: json['orignal_language'] as String,
      originalTitle: json['original_title'] as String,
      genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
      backdropPath: json['backdrop_path'] as String,
      adult: json['adult'] as bool,
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String)
    ..profilePath = json['profile_path'] as String
    ..name = json['name'] as String
    ..knownFor = (json['known_for'] as List)
        ?.map((e) =>
            e == null ? null : KnownFor.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TMDBMultiSearchResultToJson(
        TMDBMultiSearchResult instance) =>
    <String, dynamic>{
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'id': instance.id,
      'video': instance.video,
      'media_type': instance.mediaType,
      'title': instance.title,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'orignal_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'profile_path': instance.profilePath,
      'name': instance.name,
      'known_for': instance.knownFor
    };

KnownFor _$KnownForFromJson(Map<String, dynamic> json) {
  return KnownFor(
      json['id'] as int,
      json['video'] as bool,
      json['title'] as String,
      (json['popularity'] as num)?.toDouble(),
      json['adult'] as bool,
      json['overview'] as String,
      json['poster_path'] as String,
      json['release_date'] as String,
      json['vote_count'] as int,
      (json['vote_average'] as num)?.toDouble(),
      json['original_language'] as String,
      json['original_title'] as String,
      (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
      json['backdrop_path'] as String,
      json['original_name'] as String,
      json['media_type'] as String,
      json['name'] as String,
      json['first_air_date'] as String,
      (json['original_country'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$KnownForToJson(KnownFor instance) => <String, dynamic>{
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
      'backdrop_path': instance.backdropPath,
      'original_name': instance.originalName,
      'media_type': instance.mediaType,
      'name': instance.name,
      'first_air_date': instance.firstAirDate,
      'original_country': instance.originCountry
    };
