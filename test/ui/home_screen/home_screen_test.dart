import 'package:cine_reel/bloc/app_bloc.dart';
import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/genres_bloc.dart';
import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAppBloc extends Mock implements AppBloc {
	Locale deviceLocale = Locale("en", "gb");
}

void main() {
  var scaffoldFinder;
  var appBarFinder;
  var tabBarFinder;

  setUp(() {
    scaffoldFinder = find.byType(Scaffold);
    appBarFinder = find.byType(AppBar);
    tabBarFinder = find.byType(TabBarView);
  });

  testWidgets('should build home scaffolld with appbar and tabBarView',
      (WidgetTester tester) async {
    await pumpHomePage(tester);

    expect(scaffoldFinder, findsOneWidget);
    expect(appBarFinder, findsOneWidget);
    expect(tabBarFinder, findsOneWidget);
  });

  testWidgets('should have three MovieProvider tabs and one GenreProvider',
      (WidgetTester tester) async {
    await pumpHomePage(tester);
    TabBarView tabBarView = tester.widget(tabBarFinder);

    expect(tabBarView.children[0] is BlocProvider<MovieBloc>, true);
		expect(tabBarView.children[1] is BlocProvider<MovieBloc>, true);
    expect(tabBarView.children[2] is BlocProvider<MovieBloc>, true);
		expect(tabBarView.children[3] is BlocProvider<MovieBloc>, true);
    expect(tabBarView.children[4] is BlocProvider<GenresBloc>, true);

		expect(tabBarView.children.length, 5);
  });
}

Future pumpHomePage(WidgetTester tester) async {
	await tester.pumpWidget(BlocProvider<AppBloc>(child: MaterialApp(home: HomePage(title: "test")),
			bloc: MockAppBloc()));
}
