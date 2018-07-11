import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/models/MovieDetails.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/movie_image_widget.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details_content.dart';

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

  /*
  This will create the full content of the details page
  The MovieImageFullScreen will be laid out in fullscreen with a blur effect
  We're passing the remaining content as overlayContent so that it can 
  be used as a child in the Container that applies the blur on the image
   */
  buildContent(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: MovieImageFullScreen(
              overlayContent: MovieDetailsContent(movie, movieDetails),
              imagePath: movie.posterPath,
              imageType: IMAGE_TYPE.POSTER,
              size: POSTER_SIZES['small']),
        ),
      ],
    ));
  }

}
