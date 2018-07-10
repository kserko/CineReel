import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_movies/bloc_providers/movie_details_provider.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/navigation/SlideRoute.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/movie_image_widget.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details_stream_builder.dart';

class PosterRow extends StatelessWidget {
  final Movie movie;
  final int index;

  PosterRow(this.movie, this.index);

  final defaultStyle = TextStyle(
      fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, RouteTransition(widget: MovieDetailsProvider(
						movieDetailsBloc: MovieDetailsBloc(TMDBApi(), movie.id),
							child: MovieDetailsStreamBuilder(movie))));
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

  Widget buildMovieRow(Movie movie, BuildContext context) {
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
                Hero(
                  child: MovieImage(
                      imagePath: movie.posterPath,
                      imageType: IMAGE_TYPE.POSTER,
                      size: POSTER_SIZES['small']), tag: "${movie.id}",
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
          Text("${movie.voteAverage}",
              style:
                  defaultStyle.copyWith(color: Colors.yellow, fontSize: 17.0)),
        ],
      ),
    );
  }

  Widget buildHeader(Movie movie) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(movie.title, style: defaultStyle),
              buildRating(movie),
            ]),
      ),
    );
  }

  Widget buildReleaseDate(Movie movie) {
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
