// The State represents the data the View requires. The View consumes a Stream
// of States. The view rebuilds every time the Stream emits a new State!
//
// The State Stream will emit new States depending on the situation: The
// initial state, loading states, the list of results, and any errors that
// happen.
//
// The State Stream responds to input from the View by accepting a
// Stream<String>. We call this Stream the onTextChanged "intent".
import 'package:flutter_bloc_movies/models/omdb_movie.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';

class MovieDetailsState {
  MovieDetailsState();
}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsError extends MovieDetailsState {
  final error;

  MovieDetailsError(this.error);
}

class MoviesDetailsNoResults extends MovieDetailsState {}

class MovieDetailsEmpty extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  TMDBMovieDetails movieDetails;

  MovieDetailsLoaded([this.movieDetails]);

  update({TMDBMovieDetails movieDetails, OMDBMovie
	omdbMovie}) {
    return this
      ..movieDetails = movieDetails
      ..movieDetails.omdbRatings = omdbMovie.ratings;
  }
}
