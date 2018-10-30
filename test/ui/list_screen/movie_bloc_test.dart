import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/models/tmdb_movies_response.dart';
import 'package:cine_reel/ui/list_screen/movie_state.dart';
import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/common_mocks.dart';
import '../../fixtures/movie_fixtures.dart';

const LoadingState = TypeMatcher<MoviesLoading>();
const EmptyState = TypeMatcher<MoviesEmpty>();
const ErrorState = TypeMatcher<MoviesError>();
const NoResultsState = TypeMatcher<MoviesNoResults>();
const PopulatedState = TypeMatcher<MoviesPopulated>();

void main() {
	MockTMDBApi mockTMDBApi;
	MovieBloc movieBloc;

	setUp(() {
		mockTMDBApi = MockTMDBApi();
		movieBloc = MovieBloc(api: mockTMDBApi, tabKey: TabKey.kNowPlaying);
	});

  test('emits a loading state and then a populated state', () {
		setResults(mockTMDBApi);
    expect(movieBloc.stream, emitsInOrder([LoadingState, PopulatedState]));
  });

  test('emits a loading state and then an empty state', () {
    setEmptyResults(mockTMDBApi);
    expect(movieBloc.stream, emitsInOrder([LoadingState, EmptyState]));
  });

  test('emits a loading state and then an error state', () {
    when(mockTMDBApi.nowPlayingMovies(page: 1)).thenThrow(Exception("problem"));
    expect(movieBloc.stream, emitsInOrder([LoadingState, ErrorState]));
  });

	test('emits existing data if new results are empty but already got data previously', () {
		setEmptyResults(mockTMDBApi);
		movieBloc.moviesPopulated = MoviesPopulated(basicMoviesList);

		expect(movieBloc.stream, emitsInOrder([LoadingState, PopulatedState]));

	});
}

void setResults(MockTMDBApi mockTMDBApi) {
  when(mockTMDBApi.nowPlayingMovies(page: 1))
      .thenAnswer((_) async => TMDBMoviesResponse(results: basicMoviesList));
}

void setEmptyResults(MockTMDBApi mockTMDBApi) {
  when(mockTMDBApi.nowPlayingMovies(page: 1))
      .thenAnswer((_) async => TMDBMoviesResponse(results: []));
}
