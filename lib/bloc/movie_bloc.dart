import 'dart:async';

import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/ui/list_screen/movie_state.dart';
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
