import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/poster_widget.dart';
import 'package:cine_reel/ui/list_screen/movie_row/list_row_rating_widget.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/material.dart';

const String POSTER_SIZE = SIZE_LARGE;

class PosterRow extends StatelessWidget {
  final TMDBMovieBasic movie;

  PosterRow({this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Material(
          child: InkWell(
              onTap: () {
                Router.goToMovieDetailsScreen(context, movie, POSTER_SIZE);
              },
              child: buildListMovieRow(movie, context)),
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

  Widget buildListMovieRow(TMDBMovieBasic movie, BuildContext context) {
    return DefaultTextStyle(
      style: STYLE_TITLE,
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
                  child: PosterWidget(
                    id: movie.id,
                    imagePath: movie.posterPath,
                    imageType: IMAGE_TYPE.POSTER,
                    size: POSTER_SIZE,
                    boxFit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(child: buildHeader(movie: movie))
              ],
            ),
            buildReleaseDate(movie)
          ],
        ),
      ),
    );
  }

  Widget buildHeader({TMDBMovieBasic movie, bool showRating = true}) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(movie),
            showRating ? ListRowRatingWidget(movie, null) : Container()
          ]),
    );
  }

  Widget _buildTitle(TMDBMovieBasic movie) {
    return Hero(
        child: Material(color: Colors.transparent, child: Text(movie.title, style: STYLE_TITLE)),
        tag: "${movie.id}-${movie.title}");
  }

  Widget buildReleaseDate(TMDBMovieBasic movie) {
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      child: Container(
        padding: EdgeInsets.all(3.0),
        child:
            //extract the year
            Text(movie.getUpcomingReleaseDate(), style: STYLE_TITLE.copyWith(fontSize: 14.0)),
      ),
    );
  }
}
