import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/api/omdb_api.dart';
import 'package:flutter_bloc_movies/api/tmdb_api.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_movies/bloc_providers/movie_details_provider.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_basic.dart';
import 'package:flutter_bloc_movies/navigation/SlideRoute.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details_stream_builder.dart';
import 'package:flutter_bloc_movies/ui/list_page/movie_state.dart';
import 'package:rxdart/rxdart.dart';

abstract class MovieBloc {
  TMDBApi api;
  int page = 0;

  //classes that extend this class will have to override and implement this
	// method according to their needs
	Stream<MoviesState> fetchMoviesFromNetwork();

	// This is the internal object whose stream/sink is provided by this component
	final _streamController = BehaviorSubject<MoviesState>();

	// This is the stream of movies. Use this to show the contents
	Stream<MoviesState> get stream => _streamController.stream;

	final _nextPageController = StreamController();
	Sink get nextPage => _nextPageController.sink;

	MovieBloc(this.api) {
		_nextPageController.stream.listen(fetchNextPage);
		init();
	}

	void pushDetailsScreen(BuildContext context, TMDBMovieBasic movie) {
		Navigator.push(
				context,
				RouteTransition(
						widget: MovieDetailsProvider(
								movieDetailsBloc: MovieDetailsBloc(
										tmdb: TMDBApi(),
										omdb: OMDBApi(),
										movie: movie),
								child: MovieDetailsStreamBuilder(movie))));

	}

	void init() {
		if (page == 0) {
			fetchNextPage();
		}
	}

	void dispose() {
		_streamController.close();
	}

	fetchNextPage([event]) {
		_streamController.addStream(fetchMoviesFromNetwork());
	}
}
