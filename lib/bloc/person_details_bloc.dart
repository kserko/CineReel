import 'package:cine_reel/api/tmdb_api.dart';
import 'package:rxdart/rxdart.dart';

class PersonDetailsBloc {
	TMDBApi tmdbApi;
  String personId;

	final _streamController = BehaviorSubject();


	PersonDetailsBloc({this.tmdbApi, this.personId}) {
		_streamController.addStream(_fetchDetails());

	}

  Stream _fetchDetails() {}

}