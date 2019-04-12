import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/genres/genres_list.dart';
import 'package:cine_reel/ui/list_screen/movies_listview.dart';
import 'package:cine_reel/ui/scroll_controller/list_controller.dart';
import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieListWidget extends StatefulWidget {
  final List<TMDBMovieBasic> movies;
  final TabKey tabKey;
  final MovieBloc movieBloc;
  final TMDBGenre genre;

  MovieListWidget(
      {Key key,
      @required this.movies,
      @required this.tabKey,
      @required this.movieBloc,
      this.genre})
      : super(key: key);

  @override
  MovieListWidgetState createState() {
    return new MovieListWidgetState();
  }
}

class MovieListWidgetState extends State<MovieListWidget> {
  ListController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ListController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 2000 &&
        !_scrollController.isPaused) {
      this.widget.movieBloc.nextPage.add(this.widget.tabKey);
      _scrollController.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.unPause();

    if (notGenreList()) {
      return MoviesListView(
        scrollController: _scrollController,
        movies: this.widget.movies,
      );
    } else {
      return new GenreList(
        scrollController: _scrollController,
        movies: this.widget.movies,
        genre: this.widget.genre,
      );
    }
  }

  bool isUpcoming() => this.widget.tabKey == TabKey.kUpcoming;

  bool notGenreList() => this.widget.genre == null;
}
