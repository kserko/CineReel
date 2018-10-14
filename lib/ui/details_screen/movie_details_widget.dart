import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/blurred_image.dart';
import 'package:cine_reel/ui/details_screen/movie_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final bool hasFailed;

  MovieDetailsWidget(
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
  The BlurredImage will lay out the image in fullscreen with a blur effect
  We're passing the remaining content as a child to the BlurredImage widget
  so that it be laid over the blurred image
   */
  buildContent(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: BlurredImage(
            child: MovieDetailsContent(movieDetails, movieDetailsBloc, hasFailed),
            imagePath: movieDetails.movieBasic.posterPath,
          ),
        ),
      ],
    ));
  }
}
