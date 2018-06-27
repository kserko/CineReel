import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieRow extends StatelessWidget {
  final Movie movie;

  MovieRow(this.movie);

  @override
  Widget build(BuildContext context) {
    return buildMovieRow(movie, context);
  }

  void showSnackbar(BuildContext context, String overview) {
    final snackBar = SnackBar(content: Text(overview), duration: Duration(seconds: 3));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  BoxDecoration textDecoration() {
    return const BoxDecoration(
        boxShadow: <BoxShadow>[
          const BoxShadow(
            offset: const Offset(0.0, 0.0),
            blurRadius: 40.0,
            color: Colors.black,
          )
        ]);
  }

  Widget buildMovieRow(Movie movie, BuildContext context) {
    return GestureDetector(
        onTap: () {
          showSnackbar(context, movie.overview);
        },
        child: DefaultTextStyle(
          style: new TextStyle(color: Colors.white),
          child: Card(
            elevation: 0.0,
            child: Stack(
              children: <Widget>[
                buildMovieBackdrop(movie),
                buildTitle(movie),
              ],
            ),
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
            new Text(movie.title, style: TextStyle(fontSize: 30.0, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget getAdvancedNetworkImage(Movie movie){
    return new TransitionToImage(
        AdvancedNetworkImage(backdropImagePath(movie)),
        placeholder: LinearProgressIndicator(),
        useReload: false,
        fallbackWidget: SizedBox(height: 300.0));
  }

  String backdropImagePath(Movie movie) => ImageHelper.getBackdropImagePath
    (movie.backdropPath, BACKTROP_SIZES['small']);

  Widget buildMovieBackdrop(Movie movie) {
    return Column(
      //makes the image stretch to fill the screen width
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image.network(backdropImagePath(movie),
        fit: BoxFit.fill),
      ],
    );
  }

  Widget buildMovieBackdrop2(Movie movie) {
    return Column(
      //makes the image stretch to fill the screen width
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.red,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: backdropImagePath(movie),
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
