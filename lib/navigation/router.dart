
import 'package:cine_reel/api/omdb_api.dart';
import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/bloc/search_bloc.dart';
import 'package:cine_reel/bloc_providers/movie_details_provider.dart';
import 'package:cine_reel/bloc_providers/search_provider.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/navigation/SlideRoute.dart';
import 'package:cine_reel/ui/details_screen/movie_details_screen.dart';
import 'package:cine_reel/ui/search_screen/search_screen.dart';
import 'package:flutter/widgets.dart';


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
								child: MovieDetailsScreen())));
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
