import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_basic.dart';
import 'package:flutter_bloc_movies/ui/list_screen/movie_row/poster_row.dart';

class SearchResultWidget extends StatelessWidget {
  final List<TMDBMovieBasic> movies;

	SearchResultWidget({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
			itemCount: movies.length,
				itemBuilder:(BuildContext context, int index) {
				return PosterRow(movies[index]);
		});
  }
}
