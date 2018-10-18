import 'dart:async';

import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/models/tmdb_movies_response.dart';
import 'package:cine_reel/ui/list_screen/movie_state.dart';
import 'package:cine_reel/utils/tab_constants.dart';
import 'package:rxdart/rxdart.dart';

abstract class MovieBloc {
  TMDBApi api;
  int page = 0;

  //an instance of the MoviesPopulated state that will be used for each Bloc implementation
  MoviesPopulated moviesPopulated = MoviesPopulated([]);

  // This is the internal object whose stream/sink is provided by this component
  final _streamController = BehaviorSubject<MoviesState>();

  //the tab key with which we can identify the specific bloc implementation
  TabKey tabKey;

  //The genre used only in the cases when loading a list of movies by genre
  TMDBGenre genre;

  // This is the stream of movies. Use this to show the contents
  Stream<MoviesState> get stream => _streamController.stream;

  final _nextPageController = StreamController();

  Sink get nextPage => _nextPageController.sink;

  MovieBloc({this.api, TabKey this.tabKey, TMDBGenre this.genre}) {
    _nextPageController.stream.listen(fetchNextPage);
    init();
  }

  void init() {
    if (page == 0) {
      fetchNextPage();
    }
  }

  void dispose() {
    print('closing movie bloc stream $this');
    _streamController.close();
  }

  fetchNextPage([event]) {
    _streamController.addStream(fetchMoviesFromNetwork());
  }

  Stream<MoviesState> fetchMoviesFromNetwork() async* {
    if (moviesPopulated.movies.isEmpty) {
      yield MoviesLoading();
    }

    page += 1;
    try {
      final result = await _getApiCall(page);
      if (result.isEmpty) {
        yield MoviesEmpty();
      } else {
        yield moviesPopulated.update(newMovies: result.results);
      }
    } catch (e) {
      print('error $e');
      yield MoviesError(e.toString());
    }
  }

  Future<TMDBMoviesResponse> _getApiCall(int page) {
    Future<TMDBMoviesResponse> apiCall;
    switch (tabKey) {
      case TabKey.kNowPlaying:
        apiCall = api.nowPlayingMovies(page: page);
        break;
      case TabKey.kPopular:
        apiCall = api.popularMovies(page: page);
        break;
      case TabKey.kTopRated:
        apiCall = api.topRated(page: page);
        break;
      case TabKey.kGenres:
        apiCall = api.moviesForGenre(genre: genre, page: page);
        break;
    }
    return apiCall;
  }
}
