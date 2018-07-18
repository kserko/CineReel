import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_movies/models/omdb_movie.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';

class RatingsWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;

	RatingsWidget({this.movieDetails, this.movieDetailsBloc});

  @override
  Widget build(BuildContext context) {
			return Column(
			children: <Widget>[
//				buildIMDBRating(),
			],
		);

  }

  Widget buildIMDBRating() {
		List<Widget> ratingsWidgets = [];
		for (OMDBRating rating in movieDetails.omdbRatings) {
			print(rating.source);
			ratingsWidgets.add(Text("test"));
		}
		return Container();
	}


}