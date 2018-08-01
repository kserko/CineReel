import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/details_screen/movie_details_poster_overlay.dart';
import 'package:cine_reel/ui/details_screen/movie_full_screen_poster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsContent extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final bool hasFailed;

  MovieDetailsContent(
      {@required this.movieDetails,
      @required MovieDetailsBloc this.movieDetailsBloc,
      bool this.hasFailed});

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: MovieFullScreenPoster(
              overlayContent: MovieDetailsPosterOverlay(movieDetails, movieDetailsBloc, hasFailed),
              movieId: movieDetails.movieBasic.id,
              imagePath: movieDetails.movieBasic.posterPath,
              imageType: IMAGE_TYPE.POSTER,
              size: POSTER_SIZES['small']),
        ),
      ],
    ));
  }
}
