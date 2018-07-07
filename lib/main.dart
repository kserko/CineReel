import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details.dart';
import 'package:flutter_bloc_movies/ui/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
	var title = 'A Flutter TMDB explorer in BLoCs';

	// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
			initialRoute: '/',
      routes: {
				'/': (context) => HomePage(title: title),
				'/movie_details': (context) => MovieDetails(),
			},
      title: title,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
    );
  }
}