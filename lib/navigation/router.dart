
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/api/omdb_api.dart';
import 'package:flutter_bloc_movies/api/tmdb_api.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_movies/bloc/search_bloc.dart';
import 'package:flutter_bloc_movies/bloc_providers/movie_details_provider.dart';
import 'package:flutter_bloc_movies/bloc_providers/search_provider.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_basic.dart';
import 'package:flutter_bloc_movies/navigation/SlideRoute.dart';
import 'package:flutter_bloc_movies/ui/details_screen/movie_details_screen.dart';
import 'package:flutter_bloc_movies/ui/search_screen/search_screen.dart';


class Router {
	static void pushDetailsScreen(BuildContext context, TMDBMovieBasic movie) {
		Navigator.push(
				context,
				RouteTransition(
						widget: MovieDetailsProvider(
								movieDetailsBloc: MovieDetailsBloc(
										tmdb: TMDBApi(),
										omdb: OMDBApi(),
										movie: movie),
								child: MovieDetailsScreen(movie))));
	}

  static void pushSearchScreen(BuildContext context) {
		Navigator.push(context, RouteTransition(
				widget: SearchProvider(
					searchBloc: SearchBloc(
							TMDBApi()),
					child: SearchScreen(),
				)));
	}
}
