import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';

class RatingsWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;

	RatingsWidget({this.movieDetails, this.movieDetailsBloc});

  @override
  Widget build(BuildContext context) {
			return Column(
			children: <Widget>[
				buildIMDBRating(),
				buildMetacriticRating(),
				buildRottenTomatoesRating()
			],
		);

  }

  Widget buildIMDBRating() {
  	return Text(movieDetails.getRatingFor(RATING_SOURCE.IMDB));
	}

	Widget buildRottenTomatoesRating() {
		return Text(movieDetails.getRatingFor(RATING_SOURCE.ROTTEN_TOMATOES));
	}


	Widget buildMetacriticRating() {
		return Text(movieDetails.getRatingFor(RATING_SOURCE.METACRITIC));
	}



}