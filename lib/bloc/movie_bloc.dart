import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/models/MoviesResponse.dart';
import 'package:rxdart/rxdart.dart';

//class MovieListState {
//  List<Movie> movies = [];
//  int page = 1;
//
//  MovieListState({this.movies, this.page});
//}

class MovieBloc {
  TMDBApi api;
  int page = 0;

  // This is the internal object whose stream/sink is provided by this component
  final _nowPlayingMovies = PublishSubject<List<Movie>>();
  final _topRatedMovies = ReplaySubject<List<Movie>>();
  final _nextPageController = StreamController<int>();
  final __movies = PublishSubject<Movie>();

  // This is the stream of movies. Use this to show the contents
  Stream<List<Movie>> get nowPlayingMovies => _nowPlayingMovies.stream;
	Stream<Movie> get movies => __movies.stream;

	Stream<List<Movie>> get topRatedMovies => _topRatedMovies.stream;

  Sink<int> get nextPage => _nextPageController.sink;

  MovieBloc(this.api) {
    _nextPageController.stream.listen(_handleNewPageRequest);
  }

  getNowPlayingList() {
    page += 1;

    final result = api.nowPlayingMovies(page: page)
        .then((MoviesResponse moviesResponse) {
          if (moviesResponse.hasResults()) {
            return moviesResponse.results;
          }
          if (moviesResponse.hasErrors()) {
            throw (moviesResponse.errors[0]);
          }
        });

    _nowPlayingMovies.addStream(result.asStream());
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
        return nowPlayingMovies;
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
    _nowPlayingMovies.controller.stream.length;
  }
}
