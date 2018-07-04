import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/state/movie_list_state.dart';
import 'package:flutter_bloc_movies/state/search_state.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  TMDBApi api;

  // This is the internal object whose stream/sink is provided by this component
//  final _nowPlayingSubject = BehaviorSubject<MovieListState>(seedValue: MovieListState(tab[TabKey.kNowPlaying]));
//  final _topRatedSubject = BehaviorSubject<MovieListState>(
//      seedValue: MovieListState(tab[TabKey.kTopRated]));
//  final _popularSubject = BehaviorSubject<MovieListState>(
//      seedValue: MovieListState(tab[TabKey.kPopular]));

  final _nextPageController = StreamController<TabKey>();

  // This is the stream of movies. Use this to show the contents
//  Stream<MovieListState> get nowPlayingMoviesState => _nowPlayingSubject.stream;
//
//  Stream<MovieListState> get topRatedMoviesState => _topRatedSubject.stream;
//
//  Stream<MovieListState> get popularMoviesState => _popularSubject.stream;

	final _nowPlaying = PublishSubject<MoviesState>();
	Stream<MoviesState> get nowPlayingStream => _nowPlaying.stream;

	final _popular= PublishSubject<MoviesState>();
	Stream<MoviesState> get popularStream => _popular.stream;

	final _topRated = PublishSubject<MoviesState>();
	Stream<MoviesState> get topRatedStream => _topRated.stream;

  Sink<TabKey> get nextPage => _nextPageController.sink;

  MovieBloc(this.api);
//    _nextPageController.stream.listen(_handleNewPageRequest);

//  _loadDataFromApi(Function apiCall, TabKey tabKey) {
//    apiCall().then((MoviesResponse moviesResponse) {
//      if (moviesResponse.hasResults()) {
//        _handleResults(moviesResponse.results, tabKey);
//      }
//      if (moviesResponse.hasErrors()) {
//        _handleError(moviesResponse.errors, tabKey);
//      }
//    });
//  }

  MovieListState getInitialData(TabKey tabKey) {
    fetchNextPageForTab(tabKey);
    return MovieListState(tab[tabKey]); // return an empty MovieListState as
    // initial data
  }

  fetchNextPageForTab(TabKey tabKey) {
//  	updateMovieStateToLoading(tabKey);
//  	//get the state
//  	var state = getStateFor(tabKey);
//  	//increment the page
//  	var page = state.page + 1;
//
//  	//determine the correct api call based on the tab we're on
//  	var apiCall;
//
//  	switch (tabKey) {
//			case TabKey.kNowPlaying:
//				apiCall = () => api.nowPlayingMovies(page: page);
//				break;
//			case TabKey.kTopRated:
//				apiCall = () => api.topRated(page: page);
//				break;
//			case TabKey.kPopular:
//				apiCall = () => api.popularMovies(page: page);
//				break;
//		}
    //make the call
//		_loadDataFromApi(apiCall, tabKey);
    _nowPlaying.addStream(_search());
  }

  /*
	get a movieListState for the given name. It will either return a new or cached instance
	 */
  MovieListState getStateFor(TabKey tabKey) {
    return MovieListState(tab[tabKey]);
  }

//  void _handleResults(List<Movie> results, TabKey tabKey) {
//    var movieListState = getStateFor(tabKey);
//    movieListState.update(
//        newMovies: results, newPage: movieListState.page + 1, isLoading: true);
//    _updateStateForTab(tabKey, movieListState);
//  }

//  void _handleError(List<String> errors, TabKey tabKey) {
//    var movieListState = getStateFor(tabKey);
//    movieListState.update(newMovies: [], errors: errors, isLoading: false);
//    _updateStateForTab(tabKey, movieListState);
//  }

//  getStreamForTab(TabKey tabKey) {
//    switch (tabKey) {
//      case TabKey.kNowPlaying:
//        return nowPlayingMoviesState;
//        break;
//      case TabKey.kTopRated:
//        return topRatedMoviesState;
//        break;
//      case TabKey.kPopular:
//        return popularMoviesState;
//        break;
//    }
//  }

//  _updateStateForTab(TabKey tabKey, MovieListState movieListState) {
//    BehaviorSubject<MovieListState> behaviorSubject;
//    switch (tabKey) {
//      case TabKey.kNowPlaying:
//        behaviorSubject = _nowPlayingSubject;
//        break;
//      case TabKey.kTopRated:
//        behaviorSubject = _topRatedSubject;
//        break;
//      case TabKey.kPopular:
//        behaviorSubject = _popularSubject;
//        break;
//    }

//    behaviorSubject.add(movieListState);
//    movieListState.setToNotLoading();
//    behaviorSubject.add(movieListState);
//  }

//  void _handleNewPageRequest(TabKey tabKey) {
//    print('should get new page for tab $tabKey');
//    fetchNextPageForTab(tabKey);
//  }

  void dispose() {
    //
  }

//  void updateMovieStateToLoading(TabKey tabKey) {
//    var movieListState = getStateFor(tabKey);
//    movieListState.setToLoading();
//    _updateStateForTab(tabKey, movieListState);
//  }

//  void updateMovieStateToNotLoading(TabKey tabKey) {
//    var movieListState = getStateFor(tabKey);
//    movieListState.setToNotLoading();
//    _updateStateForTab(tabKey, movieListState);
//  }

  Stream<MoviesState> _search() async* {
    print("_in search");
//    yield SearchLoading();

    try {
      final result = await api.nowPlayingMovies(page: 0);
			print("result ${result?.results?.length}");
      if (result.isEmpty) {
        yield MoviesEmpty();
      } else {
        yield MoviesPopulated(result.results);
      }
    } catch (e) {
    	print('error $e');
      yield MoviesError(e);
		}
  }
}
