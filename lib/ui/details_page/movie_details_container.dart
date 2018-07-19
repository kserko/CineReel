import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/common_widgets.dart';
import 'package:flutter_bloc_movies/ui/common_widgets/movies_loading_widget.dart';
import 'package:flutter_bloc_movies/ui/details_page/movie_details_cast_widget.dart';
import 'package:flutter_bloc_movies/ui/details_page/ratings_widget.dart';

class MovieDetailsContainer extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;

  MovieDetailsContainer({this.movieDetails, this.movieDetailsBloc});

  @override
  Widget build(BuildContext context) {
    return AnimateChildren(
        childOne: Column(
          children: <Widget>[
            RatingsWidget(
                movieDetails: movieDetails, movieDetailsBloc: movieDetailsBloc),
            buildHorizontalDivider(),
            CastWidget(movieDetails: movieDetails),
          ],
        ),
        childTwo: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MoviesLoadingWidget(visible: true),
        ),
        showHappyPath: movieDetails.hasData);
  }
}
