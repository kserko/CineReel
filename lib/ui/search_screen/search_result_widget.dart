import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/models/tmdb_person_search_response.dart';
import 'package:cine_reel/ui/grid_screen/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchResultWidget extends StatelessWidget {
  final List<TMDBMovieBasic> movies;
  final List<TMDBPersonBasic> people;

  SearchResultWidget({this.movies, this.people});

  @override
  Widget build(BuildContext context) {

		var data = isSearchingForMovies() ? movies : people;
    if (data != null) {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 5.0,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildContent(index, context);
          });
    }
    return Container();
  }

  bool isSearchingForMovies() => movies != null;

  Widget _buildContent(int index, BuildContext context) {
    if (isSearchingForMovies()) {
      return GridItem(movie: movies[index]);
    } else {
      return GridItem(person:people[index]);
    }
  }
}
