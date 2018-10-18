import 'package:cine_reel/models/tmdb_movie_basic.dart';

class SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {}

class SearchNoTerm extends SearchState {}

class SearchPopulated extends SearchState {
  final List<TMDBMovieBasic> movies;

  SearchPopulated(this.movies);
}

class SearchEmpty extends SearchState {}
