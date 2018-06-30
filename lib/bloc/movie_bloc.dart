import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/models/MoviesResponse.dart';
import 'package:flutter_bloc_movies/state/MovieListState.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  TMDBApi api;
  int page = 0;

  // This is the internal object whose stream/sink is provided by this component
  final _nowPlayingMoviesState = BehaviorSubject<MovieListState>(
      seedValue: new MovieListState("nowplaying"));

  final _topRatedMovies = ReplaySubject<List<Movie>>();
  final _nextPageController = StreamController<int>();

  // This is the stream of movies. Use this to show the contents
  Stream<MovieListState> get nowPlayingMoviesState =>
      _nowPlayingMoviesState.stream;

  Stream<List<Movie>> get topRatedMovies => _topRatedMovies.stream;

  Sink<int> get nextPage => _nextPageController.sink;

  MovieBloc(this.api) {
    _nextPageController.stream.listen(_handleNewPageRequest);
  }

  getNowPlayingList() {
  	var state = getStateFor("nowplaying");
    page += 1;

    api.nowPlayingMovies(page: page).then((MoviesResponse moviesResponse) {
      if (moviesResponse.hasResults()) {
        _handleResults(moviesResponse.results);
      }
      if (moviesResponse.hasErrors()) {
        _handleError(moviesResponse.errors);
      }
    });
  }

	MovieListState getStateFor(String listName) {
		//get a movieListState for the given name. It will either return a new or
		// cached instance
		return MovieListState(listName);
	}
  void _handleResults(List<Movie> results) {
    var movieListState = getStateFor("nowplaying");
    movieListState.movies.addAll(results);
    _nowPlayingMoviesState.add(movieListState);
  }

  void _handleError(List<String> errors) {
    throw (errors[0]);
  }

  getTopRatedList() {
    _topRatedMovies
        .addStream(api.topRated(page: 1).then((MoviesResponse moviesResponse) {
      if (moviesResponse.hasResults()) {
        return moviesResponse.results;
      }
      if (moviesResponse.hasErrors()) {
        throw (moviesResponse.errors[0]);
      }
    }).asStream());
  }

  getPageData(int tabIndex) {
    switch (tabIndex) {
      case 0:
        getNowPlayingList();
        break;
      case 1:
        getTopRatedList();
        break;
    }
  }

  getStreamForTab(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return nowPlayingMoviesState;
        break;
      case 1:
        return topRatedMovies;
        break;
    }
  }

  void _handleNewPageRequest(int tab) {
    print('should get new page for tab $tab');
    page += 1;
    getPageData(tab);
  }

  void dispose() {
    //
  }

  printSomething() {
    print('completed');
  }
}
