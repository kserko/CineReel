import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/ui/common_widgets/empty_result_widget.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/common_widgets/loading_widget.dart';
import 'package:cine_reel/ui/list_screen/movies_list_screen.dart';
import 'package:cine_reel/ui/list_screen/movies_list_widget.dart';
import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/common_mocks.dart';
import '../../test_utils.dart';

class MockMovieBloc extends Mock implements MovieBloc {
  MockMovieBloc(MockTMDBApi mockTMDBApi);
}

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

  testWidgets('streamBuilder should not have initialData', (WidgetTester tester) async {
    await pumpMainWidget(tester);
    StreamBuilder streamBuilder = tester.widget(streamBuilderFinder);
    expect(streamBuilder.initialData, null);
  });

  testWidgets('streamBuilder should have four widgets in a stack', (WidgetTester tester) async {
    await pumpMainWidget(tester);
    var stackFinder = find.byKey(Key('content'));
    expect(stackFinder, findsOneWidget);
    Stack stack = tester.widget(stackFinder);

    verifyStackContainsWidget(tester, EmptyWidget);
    verifyStackContainsWidget(tester, LoadingWidget);
    verifyStackContainsWidget(tester, ErrorsWidget);
    verifyStackContainsWidget(tester, MovieListWidget);
    expect(stack.children.length, 4);
  });
}

Future pumpMainWidget(WidgetTester tester) async {
  await tester.pumpWidget(BlocProvider<MovieBloc>(
      child: MaterialApp(home: MoviesListScreen(tabKey: TabKey.kNowPlaying)),
      bloc: MockMovieBloc(MockTMDBApi())));
}
