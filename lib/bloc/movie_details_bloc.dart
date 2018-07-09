
import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/models/MovieDetails.dart';
import 'package:flutter_bloc_movies/state/movie_state.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc {
	TMDBApi api;

	MovieDetailsLoaded movieDetailsLoaded = MovieDetailsLoaded();

	MovieDetailsBloc(this.api, int movieId) {
		_streamController.addStream(_fetchMovieDetails(movieId));
	}

	Stream<MovieDetails> _fetchMovieDetails(int movieId) async* {
		final result = await api.movieDetails(movieId: movieId);
		yield movieDetailsLoaded.movieDetails = result;
	}

	//the internal object whose sink/stream we can use
	final _streamController = BehaviorSubject<MovieDetails>();
	//the stream of movie details. use this to show the details
	Stream<MovieDetails> get stream => _streamController.stream;
}