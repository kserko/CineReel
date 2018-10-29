import 'dart:async';
import 'dart:io';

import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/ui/details_screen/movie_details_screen.dart';
import 'package:cine_reel/ui/details_screen/movie_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/common_mocks.dart';
import '../../fixtures/movie_fixtures.dart';
import '../../test_utils.dart';
import '../image_mock_http_client.dart';

class MockMovieDetailsBloc extends Mock implements MovieDetailsBloc {
  MockMovieDetailsBloc(MockTMDBApi mockTMDBApi, MockOMDBApi mockOmdbApi);
}

void main() {
  MockMovieDetailsBloc mockMovieDetailsBloc;
  var streamBuilderFinder;

  Future pumpMainWidget(WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider<MovieDetailsBloc>(
      child: MaterialApp(home: MovieDetailsScreen()),
      bloc: mockMovieDetailsBloc,
    ));
  }

  setUp(() {
    HttpOverrides.global = MyHttpOverrides();
    streamBuilderFinder = find.byKey(Key('streamBuilder'));
    mockMovieDetailsBloc = MockMovieDetailsBloc(MockTMDBApi(), MockOMDBApi());
    when(mockMovieDetailsBloc.initialData()).thenReturn(movieDetailsState);
  });

  testWidgets('should have a streambuilder', (WidgetTester tester) async {
    await pumpMainWidget(tester);
    expect(streamBuilderFinder, findsOneWidget);
  });

  testWidgets('streamBuilder should have initialData', (WidgetTester tester) async {
    await pumpMainWidget(tester);
    StreamBuilder streamBuilder = tester.widget(streamBuilderFinder);
    expect(streamBuilder.initialData, movieDetailsState);
  });

  testWidgets('streamBuilder should have a MovieDetailsWidget', (WidgetTester tester) async {
    await pumpMainWidget(tester);
    verifyStackContainsWidget(tester, MovieDetailsWidget);
  });
}
