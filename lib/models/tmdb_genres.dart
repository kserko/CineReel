import 'package:json_annotation/json_annotation.dart';

part 'tmdb_genres.g.dart';

@JsonSerializable()
class TMDBGenres extends Object with _$TMDBGenresSerializerMixin {
	List<TMDBGenre> genres;

	TMDBGenres(this.genres);
	factory TMDBGenres.fromJson(Map<String, dynamic> json) =>
			_$TMDBGenresFromJson(json);

}

@JsonSerializable()
class TMDBGenre extends Object with _$TMDBGenreSerializerMixin {
	int id;
	String name;

	TMDBGenre(this.id, this.name);
	factory TMDBGenre.fromJson(Map<String, dynamic> json) =>
			_$TMDBGenreFromJson(json);
}