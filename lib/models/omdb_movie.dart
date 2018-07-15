import 'package:json_annotation/json_annotation.dart';

part 'omdb_movie.g.dart';

@JsonSerializable()
class OMDBMovie extends Object with _$OMDBMovieSerializerMixin {

 String title;
 String year;
 String rated;
 String released;
 String runtime;
 String genre;
 String director;
 String writer;
 String actors;
 String plot;
 String language;
 String country;
 String awards;
 String poster;
 List<OMDBRating> ratings;
 String metascore;
 String imdbRating;
 String imdbVotes;
 String imdbID;
 String type;
 String dVD;
 String boxOffice;
 String production;
 String website;
 String response;


 OMDBMovie(this.title, this.year, this.rated, this.released, this.runtime,
		 this.genre, this.director, this.writer, this.actors, this.plot,
		 this.language, this.country, this.awards, this.poster, this.ratings,
		 this.metascore, this.imdbRating, this.imdbVotes, this.imdbID, this.type,
		 this.dVD, this.boxOffice, this.production, this.website, this.response);

 factory OMDBMovie.fromJson(Map<String, dynamic> json) =>
		 _$OMDBMovieFromJson(json);

}
@JsonSerializable()
class OMDBRating extends Object with _$OMDBRatingSerializerMixin{

 String source;
 String value;


 OMDBRating(this.source, this.value);

 factory OMDBRating.fromJson(Map<String, dynamic> json) =>
		 _$OMDBRatingFromJson(json);

}
