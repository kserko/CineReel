import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/models/MovieDetails.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/movie_image_widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetails movieDetails;
  final Movie movie;

  MovieDetailsWidget({@required this.movieDetails, @required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
//  	the background image with a blur effect
    return Stack(
      children: <Widget>[
        Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: MovieImage(
                  isBlurred: true,
                  imagePath: movie.posterPath,
                  imageType: IMAGE_TYPE.POSTER,
                  size: POSTER_SIZES['small']),
            ),
          ],
        )),
        buildDetails(context)
      ],
    );

//    return Container(
//      decoration: BoxDecoration(
//          image: DecorationImage(
//              image: NetworkImage(ImageHelper.getImagePath(
//                  movie.posterPath, POSTER_SIZES['small'])),
//              fit: BoxFit.fitHeight)),
//      child: new BackdropFilter(
//        //applying a blur filter on the image
//        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//        child: new Container(
//          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
//          child: buildDetails(context),
//        ),
//      ),
//    );
  }

  Widget buildDetails(BuildContext context) {
		final defaultStyle = TextStyle(
				fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);

    return Container(
      margin: const EdgeInsets.only(top: 45.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Hero(
              child: Material(
								color: Colors.transparent,
                child: Text(
                  movie.title,
                  style: defaultStyle,
                ),
              ), tag: "${movie.id}-${movie.title}",
            ),
          ),
          Expanded(
            child: Text(
              movie.overview,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ],
      ),
    );
  }
}
