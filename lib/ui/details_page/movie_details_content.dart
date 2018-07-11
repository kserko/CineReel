import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/models/MovieDetails.dart';

class MovieDetailsContent extends StatelessWidget {

	final MovieDetails movieDetails;
  final Movie movie;

	MovieDetailsContent(Movie this.movie, MovieDetails this.movieDetails);

	@override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
				fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);

		return Container(
			margin: const EdgeInsets.only(top: 45.0),
			padding: const EdgeInsets.symmetric(horizontal: 10.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					Hero(
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
					),
					Material(
						color: Colors.transparent,
						child: Text(
							movie.overview,
							style: TextStyle(fontSize: 18.0),
						),
					),
				],
			),
		);
	}
}