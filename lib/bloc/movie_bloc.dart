import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/models/MoviesResponse.dart';
import 'package:flutter_bloc_movies/state/MovieListState.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  TMDBApi api;

  // This is the internal object whose stream/sink is provided by this component
  final _nowPlayingSubject = BehaviorSubject<MovieListState>(
      seedValue: new MovieListState(tab[TabKey.kNowPlaying]));

	final _topRatedSubject = BehaviorSubject<MovieListState>(
			seedValue: new MovieListState(tab[TabKey.kTopRated]));

  final _nextPageController = StreamController<int>();

  // This is the stream of movies. Use this to show the contents
  Stream<MovieListState> get nowPlayingMoviesState => _nowPlayingSubject.stream;
	Stream<MovieListState> get topRatedMoviesState => _topRatedSubject.stream;

  Sink<int> get nextPage => _nextPageController.sink;

  MovieBloc(this.api) {
    _nextPageController.stream.listen(_handleNewPageRequest);
  }

  _loadDataFromApi(Function apiCall, TabKey tabKey) {
		apiCall().then((MoviesResponse moviesResponse) {
			if (moviesResponse.hasResults()) {
				_handleResults(moviesResponse.results, tabKey);
			}
			if (moviesResponse.hasErrors()) {
				_handleError(moviesResponse.errors);
			}
		});
	}

	fetchNextPageForTab(TabKey tabKey) {
  	//get the state
  	var state = getStateFor(tab[tabKey]);
  	//increment the page
  	var page = state.page + 1;

  	//determine the correct api call based on the tab we're on
  	var apiCall;
  	switch (tabKey) {
			case TabKey.kNowPlaying:
				apiCall = () => api.nowPlayingMovies(page: page);
				break;
			case TabKey.kTopRated:
				apiCall = () => api.topRated(page: page);
				break;
		}
		//make the call
		_loadDataFromApi(apiCall, tabKey);
	}

	/*
	get a movieListState for the given name. It will either return a new or cached instance
	 */
	MovieListState getStateFor(String listName) {
		return MovieListState(listName);
	}

  void _handleResults(List<Movie> results, TabKey tabKey) {
    var movieListState = getStateFor(tab[tabKey]);
    movieListState.update(newMovies: results, newPage: movieListState.page+1,
				loading: false);
//    movieListState.movies.addAll(results);
//    movieListState.page += 1;
    _updateStateForTab(tabKey, movieListState);
  }

  void _handleError(List<String> errors) {
    throw (errors[0]);
  }

  getStreamForTab(TabKey tabKey) {
    switch (tabKey) {
      case TabKey.kNowPlaying:
        return nowPlayingMoviesState;
        break;
      case TabKey.kTopRated:
        return topRatedMoviesState;
        break;
    }
  }

	_updateStateForTab(TabKey tabKey, MovieListState movieListState) {
		var behaviorSubject;
		switch (tabKey) {
			case TabKey.kNowPlaying:
				behaviorSubject = _nowPlayingSubject;
				break;
			case TabKey.kTopRated:
				behaviorSubject = _topRatedSubject;
				break;
		}
		behaviorSubject.add(movieListState);;
	}

  void _handleNewPageRequest(int tab) {
    print('should get new page for tab $tab');
//    page += 1;
//    getPageData(tab);
  }

  void dispose() {
    //
  }

  printSomething() {
    print('completed');
  }
}
