import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/ui/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
	testWidgets('should build home page with tabs', (WidgetTester tester)
	async {
		await tester.pumpWidget(MaterialApp(home: HomePage(title: "test")));
		var scaffoldFinder = find.byType(Scaffold);
		var appBarFinder = find.byType(AppBar);
		var tabBarFinder = find.byType(TabBarView);

		expect(scaffoldFinder, findsOneWidget);
		expect(appBarFinder, findsOneWidget);
		expect(tabBarFinder, findsOneWidget);
	});
}