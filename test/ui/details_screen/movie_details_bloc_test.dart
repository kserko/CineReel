import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/details_screen/movie_details_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/common_mocks.dart';
import '../../fixtures/movie_fixtures.dart';

const LoadingState = TypeMatcher<MovieDetailsLoadingState>();
const SuccessState = TypeMatcher<MovieDetailsSuccessState>();
const FailureState = TypeMatcher<MovieDetailsFailureState>();

void main() {
  MockTMDBApi mockTMDBApi;
  MockOMDBApi mockOMDBApi;
  MovieDetailsBloc bloc;

  setUp(() {
    mockTMDBApi = MockTMDBApi();
    mockOMDBApi = MockOMDBApi();

    bloc = MovieDetailsBloc(
      tmdb: mockTMDBApi,
      omdb: mockOMDBApi,
      movieBasic: movieOne,
    );

    when(mockTMDBApi.movieDetails(movieId: anyNamed("movieId")))
        .thenAnswer((_) async => TMDBMovieDetails());
  });

  test('returns loading state as initialData', () {
    var initialData = bloc.initialData();
    expect(initialData, LoadingState);
  });

  test('emits a loading state and then a success state', () {
    expect(bloc.stream, emitsInOrder([LoadingState, SuccessState]));
  });

  test('emit a loading state and then a failure state', () {
    var mockMovieDetails = MockMovieDetails();
    when(mockMovieDetails.hasErrors()).thenReturn(true);
    when(mockTMDBApi.movieDetails(movieId: anyNamed("movieId")))
        .thenAnswer((_) async => mockMovieDetails);

    expect(bloc.stream, emitsInOrder([LoadingState, FailureState]));
  });

	test('emit a loading state and then a failure state with exception', () {
		when(mockTMDBApi.movieDetails(movieId: anyNamed("movieId")))
				.thenAnswer((_) async => Future.error(Exception("error")));

		expect(bloc.stream, emitsInOrder([LoadingState, FailureState]));
	});

}
