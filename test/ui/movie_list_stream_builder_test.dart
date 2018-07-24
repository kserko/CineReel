import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/api/tmdb_api.dart';
import 'package:flutter_bloc_movies/bloc/now_playing_bloc.dart';
import 'package:flutter_bloc_movies/bloc_providers/movie_provider.dart';
import 'package:flutter_bloc_movies/ui/list_page/movie_list_stream_builder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
	testWidgets('should have a streambuilder', (WidgetTester tester ) async {
		await tester.pumpWidget(MovieListStreamBuilder());
		MovieProvider(
				child: MovieListStreamBuilder(),
				movieBloc: NowPlayingBloc(TMDBApi()));

		var streamBuilderFinder = find.byType(StreamBuilder);

		expect(streamBuilderFinder, findsOneWidget);
	});
}