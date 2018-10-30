import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tmdb_movie_basic.g.dart';

@JsonSerializable()
class TMDBMovieBasic extends Object with _$TMDBMovieBasicSerializerMixin {
  int id;
  bool video;
  String title;
  double popularity;
  bool adult;
  String overview;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  @JsonKey(name: "backdrop_path")
  String backdropPath;

  String getReleaseYear() {
  	return releaseDate.split("-")[0];
	}

	String getUpcomingReleaseDate() {
		var parsedReleasedDate = DateFormat("yyyy-M-dd").parse(releaseDate);
		bool isInTheFuture = parsedReleasedDate.isAfter(DateTime.now());
		if (isInTheFuture) {
			return "${DateFormat("MMM dd yyyy").format(parsedReleasedDate)}";
		} else {
			return getReleaseYear();
		}
	}

  TMDBMovieBasic(
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

  factory TMDBMovieBasic.fromJson(Map<String, dynamic> json) => _$TMDBMovieBasicFromJson(json);
}
