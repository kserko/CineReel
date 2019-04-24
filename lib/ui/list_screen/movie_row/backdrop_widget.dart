import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/common_widgets/image_loader.dart';
import 'package:flutter/material.dart';

class BackdropWidget extends StatelessWidget {
  const BackdropWidget({
    Key key,
    @required this.movie,
    @required this.context,
  }) : super(key: key);

  final TMDBMovieBasic movie;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //using half of the width as height, makes the backdrops just the right size
    //to fit exactly one after the other without gaps
    double height = width * 0.50;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: "${movie.id}-${movie.backdropPath}",
          child: SizedBox(
            height: height,
            width: width,
            child: ImageLoader(
                imagePath: movie.backdropPath,
                imageType: IMAGE_TYPE.BACKDROP,
                size: BACKDROP_SIZES[SIZE_LARGE],
                boxFit: BoxFit.fitWidth,
                animate: true),
          ),
        ),
      ],
    );
  }
}