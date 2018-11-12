import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/models/tmdb_person_search_response.dart';

class SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {}

class SearchNoTerm extends SearchState {}

class SearchPopulated extends SearchState {
  List<TMDBMovieBasic> movies = List<TMDBMovieBasic>();
  List<TMDBPersonBasic> people = List<TMDBPersonBasic>();

  SearchPopulated({this.movies, this.people}) {}
}

class SearchEmpty extends SearchState {}
