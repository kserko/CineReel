import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/state/movie_list_state.dart';
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
//        	return SearchResultWidget(items: snapshot.data.movies, visible: true);
//          return MovieRow(snapshot.data.movies[index], index);
        });
  }

  void _scrollListener() {
  	print("isLoading = ${state.isLoading}, extentAfter ${_scrollController.position.extentAfter}");
    if (_scrollController.position.extentAfter < 1000 && !state.isLoading) {
      movieBloc.nextPage.add(tabKey);
    }
  }
}
