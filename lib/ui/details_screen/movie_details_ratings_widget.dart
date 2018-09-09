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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildIMDBRating(),
        buildRottenTomatoesRating(),
        buildMetacriticRating(),
        buildTMDBRating(),
      ],
    );
  }

  Widget buildTMDBRating() {
    return Row(
      children: <Widget>[
        MaterialIcon("assets/tmdb_icon.png", _launchTMDBUrl),
        Text(movieDetails.movieBasic.voteAverage.toString()),
      ],
    );
  }

  Widget buildIMDBRating() {
    return Row(
      children: <Widget>[
        MaterialIcon("assets/imdb_icon.png", _launchIMDBUrl),
        Text(movieDetails.getRatingFor(RATING_SOURCE.IMDB)),
      ],
    );
  }

  Widget buildRottenTomatoesRating() {
    return Row(
      children: <Widget>[
        MaterialIcon("assets/rotten_tomatoes_icon.png", _launchRottenTomatoesUrl),
        Text(movieDetails.getRatingFor(RATING_SOURCE.ROTTEN_TOMATOES)),
      ],
    );
  }

  Widget buildMetacriticRating() {
    return Row(
      children: <Widget>[
        MaterialIcon("assets/metacritic.png", _launchMetacriticUrl),
        Text(movieDetails.getRatingFor(RATING_SOURCE.METACRITIC)),
      ],
    );
  }

  _launchIMDBUrl() {
    var url = "$IMDB_MOVIE_PAGE_BASE_URL/${movieDetails.imdbId}";
    return launchURL(url);
  }

  _launchTMDBUrl() {
    var url = "$TMDB_MOVIE_PAGE_BASE_URL/${movieDetails.id}";
    return launchURL(url);
  }

  _launchRottenTomatoesUrl() {
    String cleanTitle = sanitiseTitleAndJoin("_");
    var url = "$ROTTEN_TOMATOES_MOVIE_PAGE_BASE_URL/$cleanTitle";
    print(url);
    return launchURL(url);
  }

  String sanitiseTitleAndJoin(String separator) {
    RegExp nonAlphaNumeric = RegExp("[^A-z^0-9]");
    List<String> titleComponents = movieDetails.title
        .replaceAll(nonAlphaNumeric, separator)
        .split(separator)
          ..removeWhere((component) => component == "");

    String cleanTitle = titleComponents.join(separator).toLowerCase();
    return cleanTitle;
  }

  _launchMetacriticUrl() {
    print("original title: ${movieDetails.getTitle}");
    String cleanTitle = sanitiseTitleAndJoin("-");
    var url = "$METACRITIC_MOVIE_PAGE_BASE_URL/$cleanTitle";
    print(url);
    return launchURL(url);
  }
}
