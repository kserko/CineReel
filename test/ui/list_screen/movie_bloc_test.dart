import 'package:cine_reel/bloc/list_of_movies_blocs/now_playing_bloc.dart';
import 'package:cine_reel/models/tmdb_movies_response.dart';
import 'package:cine_reel/ui/list_screen/movie_state.dart';
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

	test('emits a loading state and then a populated state', () {
		MockTMDBApi mockTMDBApi = MockTMDBApi();
		NowPlayingBloc nowPlayingBloc = NowPlayingBloc(mockTMDBApi);
		setNowPlayingResults(mockTMDBApi);

		expect(nowPlayingBloc.stream, emitsInOrder([LoadingState, PopulatedState]));
	});

	test('emits a loading state and then an empty state', () {
		MockTMDBApi mockTMDBApi = MockTMDBApi();
		NowPlayingBloc nowPlayingBloc = NowPlayingBloc(mockTMDBApi);
		setEmptyNowPlayingResults(mockTMDBApi);

		expect(nowPlayingBloc.stream, emitsInOrder([LoadingState, EmptyState]));
	});

	test('emits a loading state and then an error state', () {
		MockTMDBApi mockTMDBApi = MockTMDBApi();
		NowPlayingBloc nowPlayingBloc = NowPlayingBloc(mockTMDBApi);
		when(mockTMDBApi.nowPlayingMovies(page: 1)).thenThrow(Exception("problem"));

		expect(nowPlayingBloc.stream, emitsInOrder([LoadingState, ErrorState]));
	});
}

void setNowPlayingResults(MockTMDBApi mockTMDBApi) {
  when(mockTMDBApi.nowPlayingMovies(page: 1)).thenAnswer((_) async =>
  		TMDBMoviesResponse
  			(results: mockMoviesList));
}

void setEmptyNowPlayingResults(MockTMDBApi mockTMDBApi) {
  when(mockTMDBApi.nowPlayingMovies(page: 1)).thenAnswer((_) async =>
  		TMDBMoviesResponse
  			(results: []));
}