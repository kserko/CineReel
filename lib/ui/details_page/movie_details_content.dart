import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/models/MovieDetails.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/comon_widgets.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/rating_widget.dart';

class MovieDetailsContent extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final TMDBMovieBasic movie;

  MovieDetailsContent(TMDBMovieBasic this.movie, TMDBMovieDetails this.movieDetails);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
        fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);

    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 45.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildTitle(defaultStyle),
              buildHorizontalDivider(),
              buildOverview(),
              buildHorizontalDivider(),
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
							  crossAxisAlignment: CrossAxisAlignment.end,
							  children: <Widget>[
									buildRunningTimeAndReleaseDate(),
									RatingWidget(movie),
							  ],
							)
            ],
          ),
        ),
      ],
    );
  }

  AnimatedOpacity buildRunningTimeAndReleaseDate() {
    return AnimatedOpacity(
              child: Row(
                children: <Widget>[
                  buildRunningTime(),
                  getDotSeparator(),
                  buildReleaseDate(),
                ],
              ),
              duration: Duration(milliseconds: 300),
              opacity: movieDetails == null ? 0.0 : 1.0,
            );
  }

  Widget buildOverview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: Text(
          movie.overview,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }

  Widget buildTitle(TextStyle defaultStyle) {
    return Hero(
      //wrapping up a Text with Material prevents the formatting
      // being lost between transitions
      child: Material(
        color: Colors.transparent,
        child: Text(
          movie.title,
          style: defaultStyle,
        ),
      ),
      tag: "${movie.id}-${movie.title}",
    );
  }

  buildRunningTime() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          movieDetails != null ? movieDetails.getFormattedRunningTime() : "",
          style: TextStyle(fontSize: 13.0)),
    );
  }

  buildReleaseDate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          movieDetails != null ? movieDetails.getFormattedReleaseDate() : "",
          style: TextStyle(fontSize: 13.0)),
    );
  }
}
