import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';

class MovieRow extends StatelessWidget {
  final Movie movie;
  final int index;

  MovieRow(this.movie, this.index);

	var defaultStyle = TextStyle(
			fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold);

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
      child: Stack(
        children: <Widget>[
          buildMovieBackdrop(movie),
          buildTitle(movie),
          buildRating(movie)
        ],
      ),
    );
  }

  Positioned buildRating(Movie movie) {
    return Positioned(
        top: 10.0,
        right: 10.0,
        child: Container(
          decoration: textDecoration(),
          child: Row(
            children: <Widget>[
              Text("${movie.voteAverage}", style: defaultStyle.copyWith(color: Colors.yellow)),
              Text("/10", style: defaultStyle),
            ],
          ),
        ));
  }

  Positioned buildTitle(Movie movie) {
    return Positioned(
      right: 0.0,
      left: 10.0,
      bottom: 10.0,
      child: new Container(
        decoration: textDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildExpansionTile(movie),
          ],
        ),
      ),
    );
  }

  ExpansionTile buildExpansionTile(Movie movie) {
    return ExpansionTile(
        title: Text("$index ${movie.title}",
            style: TextStyle(fontSize: 30.0, color: Colors.white)),
        children: [
          SizedBox(
            height: 100.0,
            child: ListTile(
                title: SingleChildScrollView(
              child: Text(movie.overview,
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
            )),
          )
        ]);
  }

  Widget getAdvancedNetworkImage(Movie movie) {
    return new TransitionToImage(AdvancedNetworkImage(backdropImagePath(movie)),
        placeholder: LinearProgressIndicator(),
        useReload: false,
        fallbackWidget: SizedBox(height: 300.0));
  }

  String backdropImagePath(Movie movie) => ImageHelper.getImagePath(
      movie.backdropPath, BACKTROP_SIZES['medium']);

  Widget buildMovieBackdrop(Movie movie) {
    if (movie.backdropPath != null && movie.backdropPath.isNotEmpty) {
      return Column(
        //makes the image stretch to fill the screen width
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(backdropImagePath(movie), fit: BoxFit.fill),
        ],
      );
    } else {
      return SizedBox(height: 200.0);
    }
  }
}
