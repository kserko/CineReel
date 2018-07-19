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
import 'package:flutter_bloc_movies/models/tmdb_movie_basic.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';

class MovieDetailsState {
  MovieDetailsState();
}

class MovieDetailsError extends MovieDetailsState {
  final error;

  MovieDetailsError(this.error);
}

class MovieDetailsLoaded extends MovieDetailsState {
  TMDBMovieDetails movieDetails;
  bool hasFailed;

  MovieDetailsLoaded({this.movieDetails});


	update({TMDBMovieDetails movieDetails,
		TMDBMovieBasic movieBasic,
		OMDBMovie omdbMovie,
		bool hasSucceeded,
		bool hasFailed}) {
    return this
			..hasFailed = hasFailed
      ..movieDetails = movieDetails ?? this.movieDetails
			..movieDetails.hasData = hasSucceeded
			..movieDetails.movieBasic = movieBasic ?? this.movieDetails.movieBasic
			..movieDetails.omdbMovie = omdbMovie;
  }
}
