
import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details_state.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc {
	TMDBApi api;

	MovieDetailsLoaded movieDetailsLoaded = MovieDetailsLoaded();

	MovieDetailsBloc(this.api, int movieId) {
		_streamController.addStream(_fetchMovieDetails(movieId));
	}

	//the internal object whose sink/stream we can use
	final _streamController = BehaviorSubject<MovieDetailsState>();
	//the stream of movie details. use this to show the details
	Stream<MovieDetailsState> get stream => _streamController.stream;

	Stream<MovieDetailsState> _fetchMovieDetails(int movieId) async* {
		if (movieDetailsLoaded.movieDetails == null) {
			yield MovieDetailsLoading();
		}

		try {
		  final result = await api.movieDetails(movieId: movieId);
		  if(result.hasErrors()) {
		  	yield MovieDetailsError(result.status_message);
			} else {
				yield movieDetailsLoaded.update(result);
			}
		} catch (e) {
		  print('error $e');
		  yield MovieDetailsError(e);
		}
	}
}