import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsRatingsWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;

  MovieDetailsRatingsWidget({this.movieDetails, this.movieDetailsBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildIMDBRating(),
          buildRottenTomatoesRating(),
          buildMetacriticRating(),
          buildTMDBRating(),
        ],
      ),
    );
  }

  Widget buildTMDBRating() {
    return Row(
      children: <Widget>[
        MaterialIcon("assets/tmdb_icon.png", launchTMDBUrl),
        Text(movieDetails.movieBasic.voteAverage.toString()),
      ],
    );
  }

  Widget buildIMDBRating() {
    return Row(
      children: <Widget>[
        MaterialIcon("assets/imdb_icon.png", launchIMDBUrl),
        Text(movieDetails.getRatingFor(RATING_SOURCE.IMDB)),
			],
    );
  }

  launchIMDBUrl() {
    var url = "$IMDB_MOVIE_PAGE_BASE_URL/${movieDetails.imdbId}";
    return launchURL(url);
  }

  launchTMDBUrl() {
		var url = "$TMDB_MOVIE_PAGE_BASE_URL/${movieDetails.id}";
		return launchURL(url);
	}

  Widget buildRottenTomatoesRating() {
    return Row(
      children: <Widget>[
        MaterialIcon("assets/rotten_tomatoes_icon.png"),
        Text(movieDetails.getRatingFor(RATING_SOURCE.ROTTEN_TOMATOES)),
      ],
    );
  }

  Widget buildMetacriticRating() {
    return Row(
      children: <Widget>[
      	MaterialIcon("assets/metacritic.png"),
        Text(movieDetails.getRatingFor(RATING_SOURCE.METACRITIC)),
      ],
    );
  }
}
