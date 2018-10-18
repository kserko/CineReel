import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/ui/genres/genre_grid_item.dart';
import 'package:cine_reel/ui/genres/genres_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/genres_fixtures.dart';

void main() {
  testWidgets('should have a Gridview', (WidgetTester tester) async {
    await pumpMainWidget(tester, genresList);
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('GridView should get populated with GenreGridItems', (WidgetTester tester) async {
    await pumpMainWidget(tester, genresList);
    expect(find.byType(GenreGridItem), findsNWidgets(5));
  });

  testWidgets('Each GenreGridItem should have the name of the genre', (WidgetTester tester) async {
    await pumpMainWidget(tester, genresList);
    for (int i = 1; i < genresList.length; i++) {
      TMDBGenre genre = genresList[i];
      expect(find.text("${genre.name}"), findsOneWidget);
    }
  });
}

Future pumpMainWidget(WidgetTester tester, List<TMDBGenre> genres) async {
  await tester.pumpWidget(MaterialApp(
      home: GenresWidget(
    genres: genres,
    visible: genres.isNotEmpty,
  )));
}
