import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/list_screen/movie_row/poster_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchResultWidget extends StatelessWidget {
  final List<TMDBMovieBasic> movies;

  SearchResultWidget({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return PosterRow(movies[index]);
        });
  }
}
