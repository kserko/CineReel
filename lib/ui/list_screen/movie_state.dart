// The State represents the data the View requires. The View consumes a Stream
// of States. The view rebuilds every time the Stream emits a new State!
//
// The State Stream will emit new States depending on the situation: The
// initial state, loading states, the list of results, and any errors that
// happen.
//
// The State Stream responds to input from the View by accepting a
// Stream<String>. We call this Stream the onTextChanged "intent".
import 'package:cine_reel/models/tmdb_movie_basic.dart';

class MoviesState {
  MoviesState();
}

class MoviesLoading extends MoviesState {}

class MoviesError extends MoviesState {
  final String error;
  MoviesError(this.error);
}

class MoviesNoResults extends MoviesState {}

class MoviesPopulated extends MoviesState {
  final List<TMDBMovieBasic> movies;

  update({List<TMDBMovieBasic> newMovies}) {
    return this..movies.addAll(newMovies ?? this.movies);
  }

  MoviesPopulated(this.movies);
}

class MoviesEmpty extends MoviesState {}
