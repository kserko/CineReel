import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/ui/list_page/movie_state.dart';

class TopRatedBloc extends MovieBloc {
	TopRatedBloc(TMDBApi api) : super(api);

  //the instance of MoviesPopulated state object that will be used for this Bloc
  MoviesPopulated moviesPopulated = MoviesPopulated([]);

  @override
	Stream<MoviesState> fetchMoviesFromNetwork() async* {
  	page+=1;
		try {
			final result = await api.topRated(page: page);

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