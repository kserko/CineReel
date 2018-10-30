import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/list_screen/movie_row/poster_row.dart';
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
      {Key key, @required this.movies, @required this.tabKey, @required this.movieBloc, this.genre})
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
    if (_scrollController.position.extentAfter < 2000 && !_scrollController.isPaused) {
      this.widget.movieBloc.nextPage.add(this.widget.tabKey);
      _scrollController.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.unPause();

    if (notGenreList()) {
      return AnimatedOpacity(
        duration: Duration(milliseconds: 800),
        opacity: this.widget.movies.isNotEmpty ? 1.0 : 0.0,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: this.widget.movies.length,
          itemBuilder: (context, index) {
            final movie = this.widget.movies[index];
            return PosterRow(movie);
          },
        ),
      );
    } else {
      return Scaffold(
          body: buildGenreList(),
          appBar: AppBar(
            title: Hero(
              child: Material(
                color: Colors.transparent,
                child: Text(
                  "${this.widget.genre.name}",
									key: Key("appBarTitle"),
                  style: TextStyle(fontSize: 23.0, color: Theme.of(context).accentColor),
                ),
              ),
              tag: "${this.widget.genre.name}",
            ),
          ));
    }
  }

  bool isUpcoming() => this.widget.tabKey == TabKey.kUpcoming;

  bool notGenreList() => this.widget.genre == null;

  Widget buildGenreList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: this.widget.movies.length,
      itemBuilder: (context, index) {
        final movie = this.widget.movies[index];
        return PosterRow(movie);
      },
    );
  }
}
