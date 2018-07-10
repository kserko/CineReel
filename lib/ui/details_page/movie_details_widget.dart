import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/MovieDetails.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/movies_loading_widget.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';

class MovieDetailsWidget extends StatelessWidget {
	final MovieDetails movieDetails;

	MovieDetailsWidget({this.movieDetails});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
				body: movieDetails == null ? MoviesLoadingWidget(visible: true) :
				Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: <Widget>[
							Expanded(child: buildContent(context)),
						],
					),
				));
	}

	buildContent(BuildContext context) {
		return Container(
			decoration: BoxDecoration(
					image: DecorationImage(
							image: NetworkImage(ImageHelper.getImagePath(
									movieDetails.posterPath, POSTER_SIZES['small'])),
							fit: BoxFit.fitHeight)),
			child: new BackdropFilter(
				//applying a blur filter on the image
				filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
				child: new Container(
					decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
					child: buildDetails(context),
				),
			),
		);
	}

Widget buildDetails(BuildContext context) {
	return Container(
		margin: const EdgeInsets.only(top: 45.0),
		padding: const EdgeInsets.symmetric(horizontal: 10.0),
		child: Column(
			children: <Widget>[
				Expanded(
					child: Text(
						movieDetails.title,
						style: TextStyle(fontSize: 24.0),
					),
				),
				Expanded(
					child: Text(
						movieDetails.overview,
						style: TextStyle(fontSize: 24.0),
					),
				),
			],
		),
	);
}}
