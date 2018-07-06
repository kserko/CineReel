import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/state/movie_state.dart';

class NowPlayingBloc extends MovieBloc {
  NowPlayingBloc(TMDBApi api) : super(api);

  //the instance of MoviesPopulated state object that will be used for this Bloc
  MoviesPopulated moviesPopulated = MoviesPopulated([]);

  @override
	Stream<MoviesState> fetchMoviesFromNetwork() async* {
  	if (moviesPopulated.movies.isEmpty) {
			yield MoviesLoading();
		}

  	page+=1;
		try {
			final result = await api.nowPlayingMovies(page: page);
			print("${result.results.length}");

			if (result.isEmpty) {
				yield MoviesEmpty();
			} else {
				yield moviesPopulated.update(newMovies: result.results);
			}
		} catch (e) {
			print('error $e');
			yield MoviesError(e);
		}
	}
}