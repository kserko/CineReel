import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/list_screen/movies_list_widget.dart';
import 'package:cine_reel/utils/tab_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockMovieBloc extends Mock implements MovieBloc {}
class MockMovie extends Mock implements TMDBMovieBasic {}
class MockClient extends Mock implements http.Client {}

void main() {
	MockMovieBloc mockMovieBloc;
	List<TMDBMovieBasic> movies;
	http.Client mockClient = MockClient();

	 setUp(() {
		mockMovieBloc = MockMovieBloc();
		var mockMovie = MockMovie();
		when(mockMovie.title).thenReturn("Mock Movie Title");
		when(mockMovie.releaseDate).thenReturn("1.1.2019");
		when(mockMovie.posterPath).thenReturn("noposterpath");
		when(mockClient.get("http://image.tmdb.org/t/p/w154noposterpath")).thenAnswer((_) async => (http.Response("", 200)));
		
		movies = [mockMovie];

	 });

	Future pumpMainWidget(WidgetTester tester, MockMovieBloc mockMovieBloc) async {
		await tester.pumpWidget
			(MaterialApp(home: MovieListWidget(
				movies: movies, movieBloc: mockMovieBloc, tabKey: TabKey.kNowPlaying)));
	}

	testWidgets('should have a Listview', (WidgetTester tester) async {
		await pumpMainWidget(tester, mockMovieBloc);
		expect(find.byType(ListView), findsOneWidget);
	});
}