import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MoviesResponse.g.dart';

@JsonSerializable()
class MoviesResponse extends Object with _$MoviesResponseSerializerMixin {
  int page;
  List<Movie> results;
  @JsonKey(name: "total_results") int totalResults;
  @JsonKey(name: "total_pages") int totalPages;
  @JsonKey(name: "errors") List<String> errors;

  MoviesResponse({this.page, this.totalResults, this.totalPages, this.results, this.errors});

  bool get isEmpty => !hasResults();

  hasResults() {
    return results != null && results.length > 0;
  }

  hasErrors() {
    return errors != null && errors.length > 0;
  }

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
}