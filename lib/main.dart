import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/movie_provider.dart';
import 'package:flutter_bloc_movies/ui/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Bloc Movies',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieProvider(
          child: HomePage()),
    );
  }
}