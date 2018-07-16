import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_basic.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';

class RatingWidget extends StatelessWidget {
	final TMDBMovieBasic movie;
	final defaultStyle = TextStyle(
			fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);
	final TMDBMovieDetails movieDetails;

	RatingWidget(TMDBMovieBasic this.movie, TMDBMovieDetails this.movieDetails);

	@override
	Widget build(BuildContext context) {
		return Column(
		  children: <Widget>[
				Text(movieDetails != null ? "${movieDetails.omdbRatings[0]
						.source} - ${movieDetails.omdbRatings[0].value}" : ""),
				Hero(
		      child: Padding(
		      	padding: const EdgeInsets.only(top: 18.0),
		      	child: Row(
		      		mainAxisAlignment: MainAxisAlignment.start,
		      		children: <Widget>[
		      			Container(
		      					width: 40.0,
		      					height: 40.0,
		      					margin: const EdgeInsets.only(right: 10.0),
		      					child: Image(image: AssetImage("assets/tmdb_icon.png"))),
		      			//wrap in Material for the Hero transition
		    				Material(
		    					color: Colors.transparent,
		      			  child: Text("${movie.voteAverage}",
		      			  		style:
		      			  		defaultStyle.copyWith(color: Colors.yellow, fontSize: 17.0)),
		      			),
		      		],
		      	),
		      ), tag: "${movie.id}-${movie.voteAverage}",
		    ),
		  ],
		);
	}
}