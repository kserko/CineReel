import 'package:json_annotation/json_annotation.dart';

part 'tmdb_genres.g.dart';

@JsonSerializable()
class TMDBGenresResponse {
  List<TMDBGenre> genres;

  TMDBGenresResponse(this.genres);

  factory TMDBGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$TMDBGenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TMDBGenresResponseToJson(this);

  bool get isEmpty => genres.isEmpty;
}

@JsonSerializable()
class TMDBGenre {
  int id;
  String name;

  TMDBGenre(this.id, this.name);

  factory TMDBGenre.fromJson(Map<String, dynamic> json) => _$TMDBGenreFromJson(json);
	Map<String, dynamic> toJson() => _$TMDBGenreToJson(this);
}
