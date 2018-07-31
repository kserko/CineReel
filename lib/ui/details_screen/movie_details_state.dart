// The State represents the data the View requires. The View consumes a Stream
// of States. The view rebuilds every time the Stream emits a new State!
//
// The State Stream will emit new States depending on the situation: The
// initial state, loading states, the list of results, and any errors that
// happen.
//
// The State Stream responds to input from the View by accepting a
// Stream<String>. We call this Stream the onTextChanged "intent".
import 'package:cine_reel/models/omdb_movie.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';

class MovieDetailsState {
  TMDBMovieDetails movieDetails;
	bool hasFailed;

	MovieDetailsState({this.movieDetails});

	initialState({TMDBMovieDetails movieDetails, TMDBMovieBasic movieBasic}) {
		return this
			..movieDetails = movieDetails
			..hasFailed = false
			..movieDetails.hasData = false
			..movieDetails.movieBasic = movieBasic;
	}

	withSuccess({TMDBMovieDetails movieDetails, TMDBMovieBasic movieBasic, OMDBMovie omdbMovie}) {
		return this
			..movieDetails = movieDetails ?? this.movieDetails
			..hasFailed = false
			..movieDetails.hasData = true
			..movieDetails.movieBasic = movieBasic ?? this.movieDetails.movieBasic
			..movieDetails.omdbMovie = omdbMovie;
	}

	withFailure({String status_message}) {
		return this
				..hasFailed = true
				..movieDetails.hasData = false
				..movieDetails.status_message = status_message;
	}
}
