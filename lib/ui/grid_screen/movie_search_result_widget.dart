import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/common_widgets/poster_widget.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieSearchResultWidget extends StatelessWidget {
  final TMDBMovieBasic movie;

  MovieSearchResultWidget({this.movie});

  BoxDecoration textDecoration() {
    return const BoxDecoration(boxShadow: <BoxShadow>[
      const BoxShadow(
        offset: const Offset(0.0, 0.0),
        blurRadius: 40.0,
        color: Colors.black,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: STYLE_TITLE,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Material(
                child: InkWell(
                  onTap: () => Router.goToMovieDetailsScreen(
                      context, movie, POSTER_SIZE),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: getPosterWidget(),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        start: 4.0,
                        end: 4.0,
                        bottom: 4.0,
                        child: Container(
                          decoration: textDecoration(),
                          child: _buildTitle(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PosterWidget getPosterWidget() {
    String imagePath = movie.posterPath;
    IMAGE_TYPE imageType = IMAGE_TYPE.POSTER;
    String size = POSTER_SIZE;

    return PosterWidget(
        id: movie.id,
        imagePath: imagePath,
        imageType: imageType,
        boxFit: BoxFit.fitHeight,
        animate: false,
        size: size);
  }

  Widget _buildTitle() {
    return Hero(
        child: Material(
            color: Colors.transparent,
            child: Text(movie.title, style: STYLE_SUBTITLE)),
        tag: "${movie.id}-${movie.title}");
  }
}
