import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MoviesResponse.g.dart';

@JsonSerializable()
class MoviesResponse extends Object with _$MoviesResponseSerializerMixin {
  int page;
  List<Movie> results;
  @JsonKey(name: "total_results") int totalResults;
  @JsonKey(name: "total_pages") int totalPages;

  MoviesResponse({this.page, this.totalResults, this.totalPages, this.results});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
}