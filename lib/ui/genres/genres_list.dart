import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/details_screen/genre_pill_widget.dart';
import 'package:cine_reel/ui/list_screen/movie_row/backdrop_row.dart';
import 'package:cine_reel/ui/scroll_controller/list_controller.dart';
import 'package:flutter/material.dart';

class GenreList extends StatelessWidget {
  final TMDBGenre genre;
  final ListController scrollController;
  final List<TMDBMovieBasic> movies;

  const GenreList(
      {Key key,
      @required ListController this.scrollController,
      @required TMDBGenre this.genre,
      @required List<TMDBMovieBasic> this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildGenreList(),
        appBar: AppBar(
          title: GenrePill(genre: genre,fontSize: 23.0,)
        ));
  }

  Widget buildGenreList() {
    return ListView.builder(
      controller: scrollController,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return BackdropRow(movie: movie);
      },
    );
  }
}
