import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/models/tmdb_person.dart';
import 'package:cine_reel/ui/person_details/person_state.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc extends BlocBase {
  TMDBApi tmdbApi;
  int personId;

  final _streamController = BehaviorSubject<PersonState>();
  Stream<PersonState> get stream => _streamController.stream;

  PersonBloc({this.tmdbApi, this.personId}) {
    _streamController.addStream(_fetchDetails());
  }

  Stream<PersonState> _fetchDetails() async* {
    yield PersonLoading();

    try {
      TMDBPerson tmdbPerson = await tmdbApi.getPerson(personId: personId);
      if (tmdbPerson.isEmpty()) {
      	yield PersonFailed("Failed to get cast details. Please check your connection and try again.");
			} else {
				yield PersonPopulated(tmdbPerson: tmdbPerson);
			}
    } on Exception catch (e) {
      yield PersonFailed(e.toString());
    }
  }

  void dispose() {
    _streamController.close();
  }
}
