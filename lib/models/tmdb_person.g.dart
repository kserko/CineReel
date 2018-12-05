// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBPerson _$TMDBPersonFromJson(Map<String, dynamic> json) {
  return TMDBPerson(
      birthday: json['birthday'] as String,
      knownForDepartment: json['known_for_department'] as String,
      deathDay: json['death_day'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      alsoKnownAs:
          (json['also_known_as'] as List)?.map((e) => e as String)?.toList(),
      gender: json['gender'] as int,
      biography: json['biography'] as String,
      popularity: (json['popularity'] as num)?.toDouble(),
      placeOfBirth: json['place_of_birth'] as String,
      profilePath: json['profile_path'] as String,
      adult: json['adult'] as bool,
      imdbId: json['imdb_id'] as String,
      homepage: json['homepage'] as String,
      movieCredits: json['movie_credits'] == null
          ? null
          : TMDBMovieCredits.fromJson(
              json['movie_credits'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TMDBPersonToJson(TMDBPerson instance) =>
    <String, dynamic>{
      'birthday': instance.birthday,
      'known_for_department': instance.knownForDepartment,
      'death_day': instance.deathDay,
      'id': instance.id,
      'name': instance.name,
      'also_known_as': instance.alsoKnownAs,
      'gender': instance.gender,
      'biography': instance.biography,
      'popularity': instance.popularity,
      'place_of_birth': instance.placeOfBirth,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'imdb_id': instance.imdbId,
      'homepage': instance.homepage,
      'movie_credits': instance.movieCredits
    };
