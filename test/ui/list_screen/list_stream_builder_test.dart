import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/now_playing_bloc.dart';
import 'package:cine_reel/bloc_providers/movie_provider.dart';
import 'package:cine_reel/ui/common_widgets/empty_result_widget.dart';
import 'package:cine_reel/ui/common_widgets/movies_error_widget.dart';
import 'package:cine_reel/ui/common_widgets/movies_loading_widget.dart';
import 'package:cine_reel/ui/list_screen/movies_list_screen.dart';
import 'package:cine_reel/ui/list_screen/movies_list_widget.dart';
import 'package:cine_reel/utils/TabConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
	var streamBuilderFinder;

	setUp(() {
		streamBuilderFinder = find.byKey(Key('streamBuilder'));
	});

	testWidgets('should have a streambuilder', (WidgetTester tester) async {
		await pumpMainWidget(tester);

		var rootFinder = find.byKey(Key("rootColumn"));

		expect(rootFinder, findsOneWidget);
		expect(streamBuilderFinder, findsOneWidget);
	});

	testWidgets('streamBuilder should not have initialData', (WidgetTester
	tester) async {
		await pumpMainWidget(tester);
		StreamBuilder streamBuilder = tester.widget(streamBuilderFinder);
		expect(streamBuilder.initialData, null);
	});

	testWidgets('streamBuilder should have four widgets in a stack', (WidgetTester
	tester) async {
		await pumpMainWidget(tester);
		var stackFinder = find.byKey(Key('content'));
		expect(stackFinder, findsOneWidget);
		Stack stack = tester.widget(stackFinder);

		verifyStackContainsWidget(tester, EmptyWidget);
		verifyStackContainsWidget(tester, MoviesLoadingWidget);
		verifyStackContainsWidget(tester, MoviesErrorWidget);
		verifyStackContainsWidget(tester, MovieListWidget);
		expect(stack.children.length, 4);
	});
}

/*Verify that a given widget type is a descendant of the Stack widget in the
layout
*/
void verifyStackContainsWidget(WidgetTester tester, Type
descendantWidget) {
	var stackFinder = find.byKey(Key('content'));
	Stack stack = tester.widget(stackFinder);

	expect(
  	tester.widget<Stack>(
  		find.ancestor(
  			of: find.byType(descendantWidget),
  			matching: stackFinder,
			matchRoot: false),
  		), stack
  	);
}

Future pumpMainWidget(WidgetTester tester) async {
  await tester.pumpWidget(MovieProvider(
  		child: MaterialApp(home: MoviesListScreen(tabKey: TabKey.kNowPlaying)), movieBloc:
  NowPlayingBloc(TMDBApi())));
}