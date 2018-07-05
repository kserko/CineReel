import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';

class MovieRow2 extends StatelessWidget {
  final Movie movie;
  final int index;

  MovieRow2(this.movie, this.index);

  var defaultStyle = TextStyle(
      fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return buildMovieRow(movie, context);
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

  Widget buildMovieRow(Movie movie, BuildContext context) {
    return DefaultTextStyle(
      style: defaultStyle,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            leftSection(movie),
            rightSection(movie),
          ],
        ),
      ),
    );
  }

  Widget buildRating(Movie movie) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        	Container(
						width: 40.0,
							height: 40.0,
							margin: const EdgeInsets.only(right: 10.0),
							child: Image(image: AssetImage("assets/tmdb_icon.png"))),
          Text("${movie.voteAverage}", style: defaultStyle.copyWith(color: Colors.yellow, fontSize: 17.0)),
          Text(" / 10", style: defaultStyle.copyWith(fontSize: 17.0)),
        ],
      ),
    );
  }

  Widget rightSection(Movie movie) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(movie.title, style: defaultStyle),
            buildRating(movie)
          ],
        ),
      ),
    );
  }

  Widget getAdvancedNetworkImage(Movie movie) {
    return new TransitionToImage(AdvancedNetworkImage(posterImagePath(movie)),
        placeholder: LinearProgressIndicator(),
        useReload: false,
        fallbackWidget: SizedBox(height: 300.0));
  }

  String posterImagePath(Movie movie) =>
      ImageHelper.getImagePath(movie.posterPath, POSTER_SIZES['small']);

  Widget leftSection(Movie movie) {
    return getAdvancedNetworkImage(movie);
  }
}
