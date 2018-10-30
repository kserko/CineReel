import 'package:cine_reel/api/omdb_api.dart';
import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/list_of_movies_blocs/movie_list_for_genre_bloc.dart';
import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/bloc/person_bloc.dart';
import 'package:cine_reel/bloc/search_bloc.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/navigation/SlideRoute.dart';
import 'package:cine_reel/ui/details_screen/movie_details_screen.dart';
import 'package:cine_reel/ui/list_screen/movies_list_screen.dart';
import 'package:cine_reel/ui/person_details/person_screen.dart';
import 'package:cine_reel/ui/search_screen/search_screen.dart';
import 'package:flutter/widgets.dart';

class Router {
  static void pushDetailsScreen(BuildContext context, TMDBMovieBasic movie, String backgroundSize) {
    Navigator.push(
      context,
      RouteTransition(
        widget: BlocProvider<MovieDetailsBloc>(
          bloc: MovieDetailsBloc(tmdb: TMDBApi(), omdb: OMDBApi(), movieBasic: movie),
          child: MovieDetailsScreen(backgroundSize: backgroundSize),
        ),
      ),
    );
  }

  static void pushSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      RouteTransition(
        widget: BlocProvider<SearchBloc>(
          bloc: SearchBloc(TMDBApi()),
          child: SearchScreen(),
        ),
      ),
    );
  }

  static void pushMoviesByGenreList(BuildContext context, TMDBGenre genre) {
    Navigator.push(
      context,
      RouteTransition(
        widget: BlocProvider<MovieBloc>(
          bloc: MovieListForGenreBloc(TMDBApi(), genre),
          child: MoviesListScreen(
            genre: genre,
          ),
        ),
      ),
    );
  }

  static void pushPersonScreen(BuildContext context, Cast cast) {
    Navigator.push(
      context,
      RouteTransition(
        widget: BlocProvider<PersonBloc>(
          child: PersonScreen(cast),
          bloc: PersonBloc(tmdbApi: TMDBApi(), personId: cast.id),
        ),
      ),
    );
  }
}
