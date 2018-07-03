import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/state/MovieListState.dart';
import 'package:flutter_bloc_movies/ui/movie_row.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';

class MoviesList extends StatelessWidget {
  final AsyncSnapshot<MovieListState> snapshot;
  final MovieBloc movieBloc;
  final TabKey tabKey;
  MovieListState state;

  ScrollController _scrollController;

  MoviesList({this.snapshot, this.movieBloc, this.state, this.tabKey}) {
    _scrollController = ScrollController(initialScrollOffset: 0.0)
      ..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: snapshot.data.movies.length,
        itemBuilder: (context, index) {
          return MovieRow(snapshot.data.movies[index], index);
        });
  }

  void _scrollListener() {
  	print(state.isLoading);
		print(_scrollController.position.extentAfter);
    if (_scrollController.position.extentAfter < 500 && !state.isLoading) {
      movieBloc.nextPage.add(tabKey);
    }
  }
}
