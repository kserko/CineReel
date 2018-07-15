
import 'dart:async';

import 'package:flutter_bloc_movies/api/omdb_api.dart';
import 'package:flutter_bloc_movies/api/tmdb_api.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_basic.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details_state.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc {
	TMDBApi tmdb;
	OMDBApi omdb;

  TMDBMovieBasic movie;

	MovieDetailsLoaded movieDetailsLoaded = MovieDetailsLoaded();

	MovieDetailsBloc({this.tmdb, this.omdb, this.movie}) {
		_streamController.addStream(_fetchMovieDetails(movie.id));
	}

	//the internal object whose sink/stream we can use
	final _streamController = BehaviorSubject<MovieDetailsState>();
	//the stream of movie details. use this to show the details
	Stream<MovieDetailsState> get stream => _streamController.stream;

	Stream<MovieDetailsState> _fetchMovieDetails(int movieId) async* {

		try {
		  final result = await tmdb.movieDetails(movieId: movieId)
		  if(result.hasErrors()) {
		  	yield MovieDetailsError(result.status_message);
			} else {
				yield movieDetailsLoaded.update(result);
			}
		} catch (e) {
		  print('error $e');
		  yield MovieDetailsError(e);
		}

		//omdb trial
		String year = movie.releaseDate?.split('-')[0];
		final omdbResult = await omdb.getMovieByTitleAndYear(title: movie.title,
				year: year);
		if (omdbResult != null) {
			print("Got OMDB response");
			print (omdbResult.imdbRating);
		}
	}
}