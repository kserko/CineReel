import 'package:flutter_bloc_movies/models/Movie.dart';

class MovieListState {
	List<Movie> movies;
	List<String> errors;
	bool isLoading;
	int page = 0;

	static final Map<String, MovieListState> _cache = <String, MovieListState>{};

	MovieListState.internal({this.movies, this.page, this.errors, this
			.isLoading});

	factory MovieListState(String name) {
		if (_cache.containsKey(name)) {
			return _cache[name];
		} else {
			final movieListState = MovieListState.internal(
					movies: [],
					errors: [],
					page: 0,
					isLoading: true);
			_cache[name] = movieListState;
			return movieListState;
		}
	}

  bool get hasErrors => errors != null && errors.length > 0;

  bool get hasMovies => movies != null && movies.length > 0;

	setToLoading() {
		return this..isLoading = true;
	}

	setToNotLoading() {
		return this..isLoading = false;
	}

	update({List<Movie> newMovies, int newPage, List<String> errors, bool
	isLoading}) {
		return this
			..movies.addAll(newMovies ?? this.movies)
			..page = newPage ?? this.page
			..errors = errors ?? this.errors
			..isLoading = isLoading ?? this.isLoading;
	}
}