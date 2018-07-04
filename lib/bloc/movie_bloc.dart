import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/state/movie_state.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';
import 'package:rxdart/rxdart.dart';

abstract class MovieBloc {
  TMDBApi api;
  int page = 0;

	Stream<MoviesState> fetchMoviesFromNetwork();

	// This is the internal object whose stream/sink is provided by this component
	final streamController = BehaviorSubject<MoviesState>();
	// This is the stream of movies. Use this to show the contents
	Stream<MoviesState> get stream => streamController.stream;

	final _nextPageController = StreamController<TabKey>();
	Sink<TabKey> get nextPage => _nextPageController.sink;

	MovieBloc(this.api) {
		_nextPageController.stream.listen((TabKey tabKey) => print('next page for $tabKey'));
		fetchNextPage();
	}

	void dispose() {
		streamController.close();
	}

	fetchNextPage() {
		streamController.addStream(fetchMoviesFromNetwork());
	}

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

//  MovieListState getInitialData(TabKey tabKey) {
//    fetchNextPageForTab(tabKey);
//    return MovieListState(tab[tabKey]); // return an empty MovieListState as
//    // initial data
//  }

/*
	get a movieListState for the given name. It will either return a new or cached instance
	 */
//  MovieListState getStateFor(TabKey tabKey) {
//    return MovieListState(tab[tabKey]);
//  }

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
//        return nowPlayingStream;
//        break;
//      case TabKey.kTopRated:
//        return topRatedStream;
//        break;
//      case TabKey.kPopular:
//        return popularStream;
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


//    print("_in search");
////    yield SearchLoading();
//
//    try {
//      final result = await apiCall();
//      if (result.isEmpty) {
//        yield MoviesEmpty();
//      } else {
//        yield MoviesPopulated(result.results);
//      }
//    } catch (e) {
//    	print('error $e');
//      yield MoviesError(e);
//		}
//  }
}
