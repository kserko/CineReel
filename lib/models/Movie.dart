import 'package:json_annotation/json_annotation.dart';

part 'Movie.g.dart';

@JsonSerializable()
class Movie extends Object with _$MovieSerializerMixin {
  int id;
  bool video;
  String title;
  double popularity;
  bool adult;
  String overview;
  @JsonKey(name: "poster_path") String posterPath;
  @JsonKey(name: "release_date") String releaseDate;
  @JsonKey(name: 'vote_count') int voteCount;
  @JsonKey(name: "vote_average") double voteAverage;
  @JsonKey(name: "original_language") String originalLanguage;
  @JsonKey(name: "original_title") String originalTitle;
  @JsonKey(name: "genre_ids") List<int> genreIds;
  @JsonKey(name: "backdrop_path") String backdropPath;

  Movie(
      {this.voteCount,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
