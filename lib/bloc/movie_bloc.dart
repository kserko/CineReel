import 'dart:async';

import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/models/tmdb_movies_response.dart';
import 'package:cine_reel/ui/list_screen/movie_state.dart';
import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends BlocBase {
  TMDBApi api;
  int page = 0;
  String region;

  //an instance of the MoviesPopulated state that will be used for each Bloc implementation
  MoviesPopulated moviesPopulated = MoviesPopulated([]);

  // This is the internal object whose stream/sink is provided by this component
  var _streamController = BehaviorSubject<MoviesState>();

  //the tab key with which we can identify the specific bloc implementation
  TabKey tabKey;

  //The genre used only in the cases when loading a list of movies by genre
  TMDBGenre genre;

  // This is the stream of movies. Use this to show the contents
  Stream<MoviesState> get stream => _streamController.stream;

  final _nextPageController = StreamController();

  Sink get nextPage => _nextPageController.sink;

  MovieBloc({this.api, TabKey this.tabKey, TMDBGenre this.genre, String this.region}) {
    _nextPageController.stream.listen(fetchNextPage);
    init();
  }

  @override
  void dispose() {
    print('dispose $tabKey');
    _streamController.close();
  }

  void init() {
    print('initialising bloc for $tabKey');
    _streamController = BehaviorSubject<MoviesState>();
    if (page == 0) {
      fetchNextPage();
    }
  }

  fetchNextPage([event]) {
    _streamController.addStream(fetchMoviesFromNetwork());
  }

  Stream<MoviesState> fetchMoviesFromNetwork() async* {
    if (_hasNoExistingData()) {
      yield MoviesLoading();
    }

    page += 1;
    try {
      final result = await _getApiCall(page);
      if (result.isEmpty && _hasNoExistingData()) {
        yield MoviesEmpty();
      } else {
        yield moviesPopulated.update(newMovies: result.results);
      }
    } catch (e) {
      print('error $e');
      yield MoviesError(e.toString());
    }
  }

  //sorts movies by release date in ascending order (i.e going from now to the future)
	List<TMDBMovieBasic> sortMoviesByReleaseDate() {
		moviesPopulated.movies.sort((a, b) {
			var releaseDateA = DateFormat("yyyy-M-dd").parse(a.releaseDate);
			var releaseDateB = DateFormat("yyyy-M-dd").parse(b.releaseDate);
			if (releaseDateA.isAfter(releaseDateB)) {
				return 1;
			}
			else if (releaseDateA.isBefore(releaseDateB)) {
				return -1;
			} else {
				return 0;
			}
		});
		return moviesPopulated.movies;
	}

  bool _hasNoExistingData() => moviesPopulated.movies?.isEmpty ?? true;

  Future<TMDBMoviesResponse> _getApiCall(int page) {
    Future<TMDBMoviesResponse> apiCall;
    switch (tabKey) {
      case TabKey.kNowPlaying:
        apiCall = api.nowPlayingMovies(page: page);
        break;
			case TabKey.kUpcoming:
				apiCall = api.upcomingMovies(page: page, region: region);
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
