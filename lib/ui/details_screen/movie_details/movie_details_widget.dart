import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/details_screen/movie_details/movie_details_content_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final bool hasFailed;
  final String backgroundSize;

  MovieDetailsWidget(
      {@required this.movieDetails,
      @required this.movieDetailsBloc,
      @required bool this.hasFailed,
      @required this.backgroundSize});

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }

  /*
  A stack with a blurred background and contents laid out on top of it
   */
  buildContent(BuildContext context) {
    return MovieDetailsContentAnimator(
      movieDetails: movieDetails,
      movieDetailsBloc: movieDetailsBloc,
			backgroundSize: backgroundSize,
      hasFailed: hasFailed,
    );
  }
}
