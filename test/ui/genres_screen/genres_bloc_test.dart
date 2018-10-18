import 'dart:async';

import 'package:cine_reel/bloc/genres_bloc.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/ui/genres/genres_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/common_mocks.dart';
import '../../fixtures/genres_fixtures.dart';

const EmptyState = TypeMatcher<GenresEmpty>();
const PopulatedState = TypeMatcher<GenresPopulated>();
const LoadingState = TypeMatcher<GenresLoading>();
const ErrorState = TypeMatcher<GenresError>();

void main() {
  GenresBloc bloc;
  setUp(() {
    bloc = GenresBloc(tmdbApi: MockTMDBApi(), fetchOnInit: true);
    when(bloc.tmdbApi.getGenres()).thenAnswer((_) async => TMDBGenresResponse(genresList));
  });
  test('emits a loading state and then an empty state when the api returns no results', () {
    when(bloc.tmdbApi.getGenres()).thenAnswer((_) async => TMDBGenresResponse([]));
    expect(bloc.stream, emitsInOrder([LoadingState, EmptyState]));
  });

  test('emits a loading state then a populated state when api returns results', () {
    expect(bloc.stream, emitsInOrder([LoadingState, PopulatedState]));
  });

  test('throws an error when the backend errors', () {
    when(bloc.tmdbApi.getGenres()).thenThrow(Exception());
    expect(bloc.stream, emitsInOrder([LoadingState, ErrorState]));
  });

  test('closes the stream on dispose', () {
    bloc = GenresBloc(tmdbApi: MockTMDBApi(), fetchOnInit: false);

    scheduleMicrotask(() {
      bloc.dispose();
    });

    expect(
      bloc.stream,
      emitsInOrder([emitsDone]),
    );
  });
}
