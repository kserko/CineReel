import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/movie_poster_widget.dart';
import 'package:cine_reel/ui/list_screen/movie_row/list_row_rating_widget.dart';
import 'package:flutter/material.dart';

class PosterRow extends StatelessWidget {
  final TMDBMovieBasic movie;

  PosterRow(this.movie);

  final defaultStyle = TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Material(
          child: InkWell(
              onTap: () {
                Router.pushDetailsScreen(context, movie);
              },
              child: buildMovieRow(movie, context)),
        ),
        buildHorizontalDivider(height: 1.0, color: Theme.of(context).accentColor),
      ],
    );
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
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: MoviePosterWidget(
                      id: movie.id,
                      imagePath: movie.posterPath,
                      imageType: IMAGE_TYPE.POSTER,
                      size: SIZE_LARGE),
                ),
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
                      color: Colors.transparent, child: Text(movie.title, style: defaultStyle)),
                  tag: "${movie.id}-${movie.title}"),
              ListRowRatingWidget(movie, null),
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
            Text(movie.releaseDate.split("-")[0], style: defaultStyle.copyWith(fontSize: 14.0)),
      ),
    );
  }
}
