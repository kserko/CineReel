/*Verify that a given widget type is a descendant of the Stack widget in the
layout
*/
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void verifyStackContainsWidget(WidgetTester tester, Type descendantWidget) {
  var stackFinder = find.byKey(Key('content'));
  Stack stack = tester.widget(stackFinder);

  expect(
    tester.widget<Stack>(
      find.ancestor(
        of: find.byType(descendantWidget),
        matching: stackFinder,
        matchRoot: false,
      ),
    ),
    stack,
  );
}
