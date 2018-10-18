import 'package:json_annotation/json_annotation.dart';

part 'tmdb_genres.g.dart';

@JsonSerializable()
class TMDBGenresResponse extends Object with _$TMDBGenresResponseSerializerMixin {
  List<TMDBGenre> genres;

  TMDBGenresResponse(this.genres);
  factory TMDBGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$TMDBGenresResponseFromJson(json);

  bool get isEmpty => genres.isEmpty;
}

@JsonSerializable()
class TMDBGenre extends Object with _$TMDBGenreSerializerMixin {
  int id;
  String name;

  TMDBGenre(this.id, this.name);
  factory TMDBGenre.fromJson(Map<String, dynamic> json) => _$TMDBGenreFromJson(json);
}
