import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/genres_bloc.dart';
import 'package:cine_reel/ui/common_widgets/empty_result_widget.dart';
import 'package:cine_reel/ui/genres/genres_screen.dart';
import 'package:cine_reel/ui/genres/genres_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/common_mocks.dart';
import '../../test_utils.dart';

class MockGenresBloc extends Mock implements GenresBloc {
  MockGenresBloc(MockTMDBApi mockTMDBApi);
}

void main() {
  var streamBuilderFinder;

  setUp(() {
    streamBuilderFinder = find.byKey(Key('streamBuilder'));
  });

  testWidgets('should have a streambuilder', (WidgetTester tester) async {
    await pumpMainWidget(tester);
    expect(streamBuilderFinder, findsOneWidget);
  });

  testWidgets('streamBuilder should not have initialData', (WidgetTester tester) async {
    await pumpMainWidget(tester);
    StreamBuilder streamBuilder = tester.widget(streamBuilderFinder);
    expect(streamBuilder.initialData, null);
  });

  testWidgets('streamBuilder should have two widgets in a stack', (WidgetTester tester) async {
    await pumpMainWidget(tester);
    var stackFinder = find.byKey(Key('content'));
    expect(stackFinder, findsOneWidget);
    Stack stack = tester.widget(stackFinder);

    verifyStackContainsWidget(tester, EmptyWidget);
    verifyStackContainsWidget(tester, GenresWidget);
    expect(stack.children.length, 2);
  });
}

Future pumpMainWidget(WidgetTester tester) async {
  await tester.pumpWidget(BlocProvider<GenresBloc>(
      child: MaterialApp(home: GenresScreen()), bloc: MockGenresBloc(MockTMDBApi())));
}
