import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/common_widgets.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/movies_error_widget.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details_container.dart';

class MovieDetailsContent extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final bool hasError;

  MovieDetailsContent(this.movieDetails, this.movieDetailsBloc, bool
	this.hasError);

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
              buildRunningTimeAndReleaseDate(),
              buildOverview(),
              buildHorizontalDivider(),
							buildMovieDetailsContainer(),
						],
          ),
        ),
      ],
    );
  }

  Widget  buildMovieDetailsContainer() {
  	if (hasError) {
  		return MoviesErrorWidget(visible: true, error: "error");
		}

    return MovieDetailsContainer(
									movieDetails: movieDetails,
									movieDetailsBloc: movieDetailsBloc);
  }

  Widget buildRunningTimeAndReleaseDate() {
    return AnimatedCrossFade(
      firstChild: Row(
        children: <Widget>[
          buildRunningTime(),
          getDotSeparator(),
          buildReleaseDate(),
        ],
      ),
			secondChild: Container(),
			duration: Duration(milliseconds: 200),
			crossFadeState: movieDetails.isLoaded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget buildOverview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: Text(
          movieDetails.getOverview,
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
          movieDetails.getTitle,
          style: defaultStyle,
        ),
      ),
      tag: "${movieDetails.getId}-${movieDetails.getTitle}",
    );
  }

  buildRunningTime() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          movieDetails.getFormattedRunningTime(),
          style: TextStyle(fontSize: 13.0)),
    );
  }

  buildReleaseDate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          movieDetails.getFormattedReleaseDate(),
          style: TextStyle(fontSize: 13.0)),
    );
  }
}
