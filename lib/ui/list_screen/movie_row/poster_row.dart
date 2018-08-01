import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/common_widgets/rating_widget.dart';
import 'package:cine_reel/ui/list_screen/movie_row/movie_image_for_poster_row.dart';
import 'package:flutter/material.dart';

class PosterRow extends StatelessWidget {
  final TMDBMovieBasic movie;

  PosterRow(this.movie);

  final defaultStyle = TextStyle(
      fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
        	Router.pushDetailsScreen(context, movie);
        },
        child: buildMovieRow(movie, context));
  }

  BoxDecoration textDecoration() {
    return const BoxDecoration(boxShadow: <BoxShadow>[
      const BoxShadow(
        offset: const Offset(0.0, 0.0),
        blurRadius: 40.0,
        color: Colors.black,
      )
    ]);
  }

  Widget buildMovieRow(TMDBMovieBasic movie, BuildContext context) {
    return DefaultTextStyle(
      style: defaultStyle,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MovieImageForRow(
                    movieId: movie.id,
                    imagePath: movie.posterPath,
                    imageType: IMAGE_TYPE.POSTER,
                    size: POSTER_SIZES['small']),
                buildHeader(movie)
              ],
            ),
            buildReleaseDate(movie)
          ],
        ),
      ),
    );
  }

  Widget buildHeader(TMDBMovieBasic movie) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                  child: Material(
                      color: Colors.transparent,
                      child: Text(movie.title, style: defaultStyle)),
                  tag: "${movie.id}-${movie.title}"),
              RatingWidget(movie, null),
            ]),
      ),
    );
  }

  Widget buildReleaseDate(TMDBMovieBasic movie) {
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      child: Container(
        child:
            //extract the year
            Text(movie.releaseDate.split("-")[0],
                style: defaultStyle.copyWith(fontSize: 14.0)),
      ),
    );
  }
}
