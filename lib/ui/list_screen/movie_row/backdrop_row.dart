import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/list_screen/movie_row/backdrop_widget.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/material.dart';

const String POSTER_SIZE = SIZE_LARGE;
const String BACKDROP_SIZE = SIZE_LARGE;

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
                Router.goToMovieDetailsScreen(context, movie, BACKDROP_SIZE);
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
    return Container(
      child: Stack(
        children: <Widget>[
          BackdropWidget(movie: movie, context: context),
          _buildHeader(movie: movie),
          Positioned(bottom: 0, right: 0, child: _buildRating(movie)),
          // buildReleaseDate(movie)
        ],
      ),
    );
  }

  Widget _buildRating(TMDBMovieBasic movie) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      decoration: textDecoration(),
      child: Row(
        children: <Widget>[
          Text("${movie.voteAverage}",
              style: STYLE_TITLE.copyWith(color: Colors.yellow)),
          Text(
            " / 10",
            style: TextStyle(fontSize: 14.0),
          ),
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
}

