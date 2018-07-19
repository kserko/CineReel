import 'dart:async';

import 'package:flutter_bloc_movies/api/omdb_api.dart';
import 'package:flutter_bloc_movies/api/tmdb_api.dart';
import 'package:flutter_bloc_movies/models/omdb_movie.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_basic.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';
import 'package:flutter_bloc_movies/models/tmdb_reviews_response.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details_state.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc {
  TMDBApi tmdb;
  OMDBApi omdb;

  TMDBMovieBasic movie;

  MovieDetailsState movieDetailsState = MovieDetailsState();

  MovieDetailsBloc({this.tmdb, this.omdb, this.movie}) {
    _streamController.addStream(_fetchMovieDetails(movie.id));
  }

  //the internal object whose sink/stream we can use
  final _streamController = BehaviorSubject<MovieDetailsState>();

  //the stream of movie details. use this to show the details
  Stream<MovieDetailsState> get stream => _streamController.stream;

	/*
  create an initial state with the basic movie object and an empty movie
	details object
	*/
	MovieDetailsState initialData() {
    return movieDetailsState.update(
        movieDetails: TMDBMovieDetails(),
        movieBasic: movie,
        hasSucceeded: false,
        hasFailed: false);
  }

  Stream<MovieDetailsState> _fetchMovieDetails(int movieId) async* {
    String year = movie.releaseDate?.split('-')[0];
    yield movieDetailsState;

    try {
      TMDBMovieDetails tmdbMovieDetails = await tmdbMovieDetailsCall(movieId);
      OMDBMovie omdbMovie = await omdbMovieByTitleAndYearCall(year);
      yield getMovieDetailsState(tmdbMovieDetails, omdbMovie);
    } on Exception catch (e) {
      print("error $e");
    }
  }

  MovieDetailsState getMovieDetailsState(TMDBMovieDetails tmdbMovieDetails, OMDBMovie
	omdbMovie) {
    if (tmdbMovieDetails.hasErrors()) {
    	//pass the status message to the initial version of the movieDetails
    				// object and don't pass the new one because everything is empty
    				// (including the movieBasic) which we need
    	movieDetailsState.movieDetails.status_message = tmdbMovieDetails.status_message;
      return movieDetailsState.update(
          hasFailed: true,
          hasSucceeded: false);
    } else {
      return movieDetailsState.update(
          hasSucceeded: true,
          hasFailed: false,
          movieBasic: movie,
          movieDetails: tmdbMovieDetails,
          omdbMovie: omdbMovie);
    }
  }

  Future<OMDBMovie> omdbMovieByTitleAndYearCall(String year) {
    return omdb.getMovieByTitleAndYear(title: movie.title, year: year);
  }

  Future<TMDBMovieDetails> tmdbMovieDetailsCall(int movieId) =>
      tmdb.movieDetails(movieId: movieId);

  Future<TMDBReviewsResponse> tmdbMovieReviewsCall(int movieId, int page) =>
      tmdb.movieReviews(movieId: movieId, page: page);
}
