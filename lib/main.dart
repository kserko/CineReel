import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/movie_provider.dart';
import 'package:flutter_bloc_movies/ui/movies_results_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Bloc Movies',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      home: MovieProvider(child: HomePage()),
    );
  }
}