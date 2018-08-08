import 'dart:async';

import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/ui/genres/genres_state.dart';
import 'package:rxdart/rxdart.dart';

class GenresBloc {
	TMDBApi tmdbApi;

	GenresBloc(this.tmdbApi) {
		_streamControler.addStream(_fetchGenres());
	}

	//the internal object whose sink/stream we can use
	final _streamControler = BehaviorSubject<GenresState>();

	//the stream of genres. We use this to show the list of fetched genres
	Stream<GenresState> get stream => _streamControler.stream;

	void dispose() {
		print('closing genres bloc stream');
		_streamControler.close();
	}

	Stream<GenresState> _fetchGenres() async * {
		yield GenresEmpty();

		print('fetching genres');
		try {
		  TMDBGenres genres = await tmdbApi.getGenres();
		  print('genres received ${genres.genres.length}');
		  yield GenresPopulated(genres);

		} on Exception catch (e) {
			print('exception: $e');
		  yield GenresError(e.toString());
		}
	}
}