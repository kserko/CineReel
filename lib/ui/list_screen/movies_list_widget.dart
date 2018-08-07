import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/list_screen/movie_row/poster_row.dart';
import 'package:cine_reel/ui/scroll_controller/list_controller.dart';
import 'package:cine_reel/utils/tab_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//As a stateful widget the state of this widget will be created once and
// subsequent calls to create the widget in the same context
// (i.e in page_stream_builder)
// will only call the build method of the state object and
class MovieListWidget extends StatefulWidget {
  final List<TMDBMovieBasic> movies;
  final TabKey tabKey;
  final MovieBloc movieBloc;

  MovieListWidget({Key key, this.movies, this.tabKey, this.movieBloc}) : super(key: key);

  @override
  MyListState createState() {
    return new MyListState();
  }
}

class MyListState extends State<MovieListWidget> {
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
  }
}
