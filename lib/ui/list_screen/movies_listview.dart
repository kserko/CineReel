import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/list_screen/movie_row/backdrop_row.dart';
import 'package:cine_reel/ui/scroll_controller/list_controller.dart';
import 'package:flutter/material.dart';

class MoviesListView extends StatelessWidget {
  final ListController scrollController;
  final List<TMDBMovieBasic> movies;

  const MoviesListView(
      {Key key,
      @required ListController this.scrollController,
      @required List<TMDBMovieBasic> this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: movies.isNotEmpty ? 1.0 : 0.0,
      child: ListView.builder(
        controller: scrollController,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return BackdropRow(movie:movie);
        },
      ),
    );
  }
}
