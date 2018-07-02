import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/state/MovieListState.dart';
import 'package:flutter_bloc_movies/ui/movie_row.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';

ScrollController _scrollController = new ScrollController(
		initialScrollOffset: 0.0
);

Widget buildListView(AsyncSnapshot<MovieListState> snapshot,
		MovieBloc movieBloc, TabKey tabKey) {
	return ListView.builder(
			controller: _scrollController,
			itemCount: snapshot.data.movies.length,
			itemBuilder: (context, index) {
				//when approaching end of list, load next page
				if (index == snapshot.data.movies.length - 2) {
					movieBloc.nextPage.add(tabKey);
				}
				return MovieRow(snapshot.data.movies[index], index);
			});
}

