import 'dart:async';

import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/ui/genres/genres_state.dart';
import 'package:rxdart/rxdart.dart';

class GenresBloc extends BlocBase {
  TMDBApi tmdbApi;
  bool fetchOnInit;

  GenresBloc({this.tmdbApi, bool this.fetchOnInit}) {
    if (fetchOnInit) {
      _streamController.addStream(_fetchGenres());
    }
  }

  //the internal object whose sink/stream we can use
  final _streamController = BehaviorSubject<GenresState>();

  //the stream of genres. We use this to show the list of fetched genres
  Stream<GenresState> get stream => _streamController.stream;


	@override
  void dispose() {
    print('closing genres bloc stream');
    _streamController.close();
  }

  Stream<GenresState> _fetchGenres() async* {
    yield GenresLoading();

    try {
      TMDBGenresResponse response = await tmdbApi.getGenres();
      if (response.isEmpty) {
        yield GenresEmpty();
      } else {
        yield GenresPopulated(response.genres);
      }
    } on Exception catch (e) {
      print('exception: $e');
      yield GenresError(e.toString());
    }
  }
}
