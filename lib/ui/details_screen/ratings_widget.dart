import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RatingsWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;

  RatingsWidget({this.movieDetails, this.movieDetailsBloc});

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
        MaterialIcon("assets/tmdb_icon.png"),
        Text(movieDetails.movieBasic.voteAverage.toString()),
      ],
    );
  }

  Widget buildIMDBRating() {
    return Row(
      children: <Widget>[
        MaterialIcon("assets/imdb_icon.png"),
        Text(movieDetails.getRatingFor(RATING_SOURCE.IMDB)),
      ],
    );
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
