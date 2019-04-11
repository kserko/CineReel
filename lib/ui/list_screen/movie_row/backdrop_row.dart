import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/common_widgets/image_loader.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/material.dart';

const String POSTER_SIZE = SIZE_LARGE;

class BackdropRow extends StatelessWidget {
  final TMDBMovieBasic movie;

  BackdropRow({this.movie});

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
        // buildHorizontalDivider(height: 0.0, color: Colors.transparent),
      ],
    );
  }

  BoxDecoration textDecoration() {
    return const BoxDecoration(boxShadow: <BoxShadow>[
      const BoxShadow(
        offset: const Offset(0.0, 0.0),
        blurRadius: 40.0,
        color: Colors.black26,
      )
    ]);
  }

  Widget buildListMovieRow(TMDBMovieBasic movie, BuildContext context) {
    return DefaultTextStyle(
      style: STYLE_TITLE,
      child: Container(
        child: Stack(
          children: <Widget>[
            _buildBackdrop(movie, context),
            _buildHeader(movie: movie),
            Positioned(bottom: 0, right: 0, child: _buildRating(movie)),
            // buildReleaseDate(movie)
          ],
        ),
      ),
    );
  }

  Widget _buildBackdrop(TMDBMovieBasic movie, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width * 0.50;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: "${movie.backdropPath}",
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

  Widget _buildRating(TMDBMovieBasic movie) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      decoration: textDecoration(),
      child: Row(
        children: <Widget>[
          Text("${movie.voteAverage}", style: TextStyle(color: Colors.yellow)),
          Text("/10"),
        ],
      ),
    );
  }

  Widget _buildHeader({TMDBMovieBasic movie, bool showRating = true}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: textDecoration(),
            padding: const EdgeInsets.only(left: 8.0),
            child: _buildTitle(movie),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(TMDBMovieBasic movie) {
    return Hero(
        child: Container(
          padding: const EdgeInsets.only(left: 4.0, top: 8.0),
          child: Material(
              color: Colors.transparent,
              child: Text(movie.title, style: STYLE_TITLE)),
        ),
        tag: "${movie.id}-${movie.title}");
  }

  Widget buildReleaseDate(TMDBMovieBasic movie) {
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child:
            //extract the year
            Text(movie.getUpcomingReleaseDate(),
                style: STYLE_TITLE.copyWith(fontSize: 14.0)),
      ),
    );
  }
}
