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
  TMDBMovieBasic movieBasic;

  MovieDetailsState({this.movieBasic, this.movieDetails}) {
    this
      ..movieDetails = movieDetails
      ..movieDetails.movieBasic = movieBasic;
  }
}

class MovieDetailsLoadingState extends MovieDetailsState {
  MovieDetailsLoadingState(
    TMDBMovieBasic movieBasic,
  ) : super(
          movieBasic: movieBasic,
          movieDetails: TMDBMovieDetails(),
        );
}

class MovieDetailsSuccessState extends MovieDetailsState {
  MovieDetailsSuccessState({
    TMDBMovieDetails movieDetails,
    TMDBMovieBasic movieBasic,
    OMDBMovie omdbMovie,
  }) : super(
          movieBasic: movieBasic,
          movieDetails: movieDetails,
        ) {
    this
      ..movieDetails.omdbMovie = omdbMovie
      ..movieDetails.hasData = true;
  }
}

class MovieDetailsFailureState extends MovieDetailsState {
  String errorMessage;

  MovieDetailsFailureState({
    TMDBMovieBasic moveBasic,
		this.errorMessage,
  }) : super(
          movieBasic: moveBasic,
          movieDetails: TMDBMovieDetails()..status_message = errorMessage,
        );
}
