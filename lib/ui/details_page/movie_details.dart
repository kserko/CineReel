import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  MovieDetails(Movie this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//			appBar: buildAppBar(context, movie.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: buildMainContent(context)),
//                child: MovieImage(
//                    movie: movie,
//                    imageType: IMAGE_TYPE.POSTER,
//                    size: POSTER_SIZES['small'])),
          ],
        ),
      ),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ImageHelper.getImagePath(
                  movie.posterPath, BACKDROP_SIZES['small'])),
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
			margin: const EdgeInsets.only(top:40.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
				crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
						mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(
                movie.title,
                style: TextStyle(fontSize: 44.0),
              ),
            ],
          ),
			],
      ),
    );
  }
}

Widget getAdvancedNetworkImage(Movie movie) {
  return new TransitionToImage(AdvancedNetworkImage(posterImagePath(movie)),
      useReload: false, fallbackWidget: SizedBox(height: 300.0));
}

String posterImagePath(Movie movie) =>
    ImageHelper.getImagePath(movie.posterPath, POSTER_SIZES['small']);

Widget buildPoster(Movie movie) {
  return getAdvancedNetworkImage(movie);
}
