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

  void _dispose() {
  	_streamController.close();
	}
	/*
  create an initial state with the basic movie object and an empty movie
	details object
	*/
	MovieDetailsState initialData() {
    return movieDetailsState.initialState(
        movieDetails: TMDBMovieDetails(),
        movieBasic: movie);
  }

  Stream<MovieDetailsState> _fetchMovieDetails(int movieId) async* {
    String year = movie.releaseDate?.split('-')[0];
    yield movieDetailsState;

    try {
      TMDBMovieDetails tmdbMovieDetails = await tmdbMovieDetailsCall(movieId);
      OMDBMovie omdbMovie = await omdbMovieByTitleAndYearCall(year);

			if (tmdbMovieDetails.hasErrors()) {
				yield movieDetailsState.withFailure(status_message: tmdbMovieDetails.status_message);
			} else {
				yield movieDetailsState.withSuccess(
						movieBasic: movie,
						movieDetails: tmdbMovieDetails,
						omdbMovie: omdbMovie);
			}
		} on Exception catch (e) {
			yield movieDetailsState.withFailure(status_message: e.toString());
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
