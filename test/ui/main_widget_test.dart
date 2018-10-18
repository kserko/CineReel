// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:cine_reel/main.dart';
import 'package:cine_reel/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should build material app with home page', (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(MyApp());
    MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
    HomePage homePage = tester.widget(find.byType(HomePage));
    var expectedTitle = "CineReel";

    //assert
    expect(materialApp.title, expectedTitle);
    expect(homePage.title, expectedTitle);
  });
}
