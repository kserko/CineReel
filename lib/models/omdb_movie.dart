import 'package:json_annotation/json_annotation.dart';

part 'omdb_movie.g.dart';

@JsonSerializable()
class OMDBMovie extends Object with _$OMDBMovieSerializerMixin {
  @JsonKey(name: "Title")
  String title;
  @JsonKey(name: "Year")
  String year;
  @JsonKey(name: "Rated")
  String rated;
  @JsonKey(name: "Released")
  String released;
  @JsonKey(name: "Runtime")
  String runtime;
  @JsonKey(name: "Genre")
  String genre;
  @JsonKey(name: "Director")
  String director;
  @JsonKey(name: "Writer")
  String writer;
  @JsonKey(name: "Actors")
  String actors;
  @JsonKey(name: "Plot")
  String plot;
  @JsonKey(name: "Language")
  String language;
  @JsonKey(name: "Country")
  String country;
  @JsonKey(name: "Awards")
  String awards;
  @JsonKey(name: "Poster")
  String poster;
  @JsonKey(name: "Ratings")
  List<OMDBRating> ratings;
  @JsonKey(name: "Metascore")
  String metascore;
  @JsonKey(name: "imdbRating")
  String imdbRating;
  @JsonKey(name: "imdbVotes")
  String imdbVotes;
  @JsonKey(name: "imdbID")
  String imdbID;
  @JsonKey(name: "Type")
  String type;
  @JsonKey(name: "DVD")
  String dvd;
  @JsonKey(name: "BoxOffice")
  String boxOffice;
  @JsonKey(name: "Production")
  String production;
  @JsonKey(name: "Website")
  String website;
  @JsonKey(name: "Response")
  String response;

  OMDBMovie(
      this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.ratings,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.type,
      this.dvd,
      this.boxOffice,
      this.production,
      this.website,
      this.response);

  factory OMDBMovie.fromJson(Map<String, dynamic> json) => _$OMDBMovieFromJson(json);
}

@JsonSerializable()
class OMDBRating extends Object with _$OMDBRatingSerializerMixin {
  @JsonKey(name: "Source")
  String source;
  @JsonKey(name: "Value")
  String value;

  OMDBRating(this.source, this.value);

  factory OMDBRating.fromJson(Map<String, dynamic> json) => _$OMDBRatingFromJson(json);
}
