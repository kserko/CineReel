import 'package:flutter_bloc_movies/models/tmdb_movie_basic.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tmdb_movies_collection_response.g.dart';

@JsonSerializable()
class TMDBMoviesCollectionResponse extends Object with
		_$TMDBMoviesCollectionResponseSerializerMixin {
  int page;
  List<TMDBMovieBasic> results;
  @JsonKey(name: "total_results") int totalResults;
  @JsonKey(name: "total_pages") int totalPages;
  @JsonKey(name: "errors") List<String> errors;

	TMDBMoviesCollectionResponse({this.page, this.totalResults, this.totalPages, this.results, this.errors});

  bool get isEmpty => !hasResults();

  hasResults() {
    return results != null && results.length > 0;
  }

  hasErrors() {
    return errors != null && errors.length > 0;
  }

  factory TMDBMoviesCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$TMDBMoviesCollectionResponseFromJson(json);
}