import 'dart:async';
import 'dart:io';

import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/list_screen/movie_row/poster_row.dart';
import 'package:cine_reel/ui/list_screen/movies_list_widget.dart';
import 'package:cine_reel/ui/scroll_controller/list_controller.dart';
import 'package:cine_reel/utils/tab_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/movie_fixtures.dart';
import 'image_mock_http_client.dart';

class MockMovieBloc extends Mock implements MovieBloc {}

void main() {
  MockMovieBloc mockMovieBloc;
  List<TMDBMovieBasic> moviesList;
  var listviewFinder = find.byType(ListView);

  setUp(() {
    HttpOverrides.global = MyHttpOverrides();
    mockMovieBloc = MockMovieBloc();
    moviesList = createMockBasicMovies();
  });

  Future pumpMainWidget(WidgetTester tester, MockMovieBloc mockMovieBloc) async {
    await tester.pumpWidget(MaterialApp(
        home:
            MovieListWidget(movies: moviesList, movieBloc: mockMovieBloc, tabKey: TabKey.kNowPlaying)));
  }

  testWidgets('should have a Listview', (WidgetTester tester) async {
    await pumpMainWidget(tester, mockMovieBloc);
    expect(listviewFinder, findsOneWidget);
  });

  testWidgets('listView should have poster rows', (WidgetTester tester) async {
    await pumpMainWidget(tester, mockMovieBloc);
    expect(find.byType(PosterRow), findsNWidgets(moviesList.length));
  });

	testWidgets('listView should have a list controller', (WidgetTester tester) async {
		await pumpMainWidget(tester, mockMovieBloc);
		ListView listView = tester.widget(listviewFinder);
		expect(listView.controller, isNotNull);
	});

	testWidgets('list controller should have a listener', (WidgetTester tester) async {
		await pumpMainWidget(tester, mockMovieBloc);
		ListView listView = tester.widget(listviewFinder);
		ListController listController = listView.controller;
		expect(listController.hasListeners, isTrue);
	});

}