// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBMovieDetails _$TMDBMovieDetailsFromJson(Map<String, dynamic> json) {
  return TMDBMovieDetails(
      json['adult'] as bool,
      json['backdrop_path'] as String,
      json['belongs_to_collection'],
      json['budget'] as int,
      (json['genres'] as List)
          ?.map((e) =>
              e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['homepage'] as String,
      json['id'] as int,
      json['imdb_id'] as String,
      json['original_language'] as String,
      json['original_title'] as String,
      json['overview'] as String,
      (json['popularity'] as num)?.toDouble(),
      json['poster_path'] as String,
      (json['production_companies'] as List)
          ?.map((e) => e == null
              ? null
              : ProductionCompany.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['production_countries'] as List)
          ?.map((e) => e == null
              ? null
              : ProductionCountry.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['release_date'] as String,
      json['revenue'] as int,
      json['runtime'] as int,
      (json['spoken_languages'] as List)
          ?.map((e) => e == null
              ? null
              : SpokenLanguage.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['status'] as String,
      json['tag_line'] as String,
      json['title'] as String,
      json['video'] as bool,
      (json['vote_average'] as num)?.toDouble(),
      json['vote_count'] as int,
      json['status_message'] as String)
    ..credits = json['credits'] == null
        ? null
        : Credits.fromJson(json['credits'] as Map<String, dynamic>)
    ..images = json['images'] == null
        ? null
        : Images.fromJson(json['images'] as Map<String, dynamic>)
    ..omdbMovie = json['omdbMovie'] == null
        ? null
        : OMDBMovie.fromJson(json['omdbMovie'] as Map<String, dynamic>)
    ..movieReviews = (json['movieReviews'] as List)
        ?.map((e) =>
            e == null ? null : TMDBReview.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..movieBasic = json['movieBasic'] == null
        ? null
        : TMDBMovieBasic.fromJson(json['movieBasic'] as Map<String, dynamic>)
    ..hasData = json['hasData'] as bool;
}

Map<String, dynamic> _$TMDBMovieDetailsToJson(TMDBMovieDetails instance) =>
    <String, dynamic>{
      'status_message': instance.status_message,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'spoken_languages': instance.spokenLanguages,
      'tag_line': instance.tagline,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'overview': instance.overview,
      'adult': instance.adult,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'popularity': instance.popularity,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'title': instance.title,
      'video': instance.video,
      'credits': instance.credits,
      'images': instance.images,
      'omdbMovie': instance.omdbMovie,
      'movieReviews': instance.movieReviews,
      'movieBasic': instance.movieBasic,
      'hasData': instance.hasData
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
      (json['backdrops'] as List)
          ?.map((e) =>
              e == null ? null : TMDBImage.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['posters'] as List)
          ?.map((e) =>
              e == null ? null : TMDBImage.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'backdrops': instance.backdrops,
      'posters': instance.posters
    };

TMDBImage _$TMDBImageFromJson(Map<String, dynamic> json) {
  return TMDBImage(
      (json['aspect_ration'] as num)?.toDouble(),
      json['file_path'] as String,
      json['height'] as int,
      json['iso_639_1'] as String,
      (json['vote_average'] as num)?.toDouble(),
      json['vote_count'] as int,
      json['width'] as int);
}

Map<String, dynamic> _$TMDBImageToJson(TMDBImage instance) => <String, dynamic>{
      'aspect_ration': instance.aspectRatio,
      'file_path': instance.filePath,
      'height': instance.height,
      'iso_639_1': instance.iso6391,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return ProductionCompany(json['id'] as int, json['logoPath'],
      json['name'] as String, json['originCountry'] as String);
}

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoPath': instance.logoPath,
      'name': instance.name,
      'originCountry': instance.originCountry
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return ProductionCountry(json['iso31661'] as String, json['name'] as String);
}

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{'iso31661': instance.iso31661, 'name': instance.name};

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return SpokenLanguage(json['iso6391'] as String, json['name'] as String);
}

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{'iso6391': instance.iso6391, 'name': instance.name};

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(json['id'] as int, json['name'] as String);
}

Map<String, dynamic> _$GenreToJson(Genre instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

Credits _$CreditsFromJson(Map<String, dynamic> json) {
  return Credits(
      (json['cast'] as List)
          ?.map((e) =>
              e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['crew'] as List)
          ?.map((e) =>
              e == null ? null : Crew.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CreditsToJson(Credits instance) =>
    <String, dynamic>{'cast': instance.cast, 'crew': instance.crew};

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(
      json['cast_id'] as int,
      json['character'] as String,
      json['credit_id'] as String,
      json['id'] as int,
      json['name'] as String,
      json['profile_path'] as String);
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath
    };

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return Crew(
      json['credit_id'] as String,
      json['department'] as String,
      json['gender'] as int,
      json['id'] as int,
      json['job'] as String,
      json['name'] as String,
      json['profile_path'] as String);
}

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'credit_id': instance.creditId,
      'department': instance.department,
      'gender': instance.gender,
      'id': instance.id,
      'job': instance.job,
      'name': instance.name,
      'profile_path': instance.profilePath
    };
