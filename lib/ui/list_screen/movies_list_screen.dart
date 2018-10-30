import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/models/tmdb_movie_basic.dart';
import 'package:cine_reel/ui/common_widgets/empty_result_widget.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/common_widgets/loading_widget.dart';
import 'package:cine_reel/ui/list_screen/movie_state.dart';
import 'package:cine_reel/ui/list_screen/movies_list_widget.dart';
import 'package:cine_reel/ui/tabs/tab_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoviesListScreen extends StatefulWidget {
  final TMDBGenre genre;

  MoviesListScreen({TMDBGenre this.genre});

  @override
  MoviesListScreenState createState() {
    return new MoviesListScreenState();
  }

  StreamBuilder<MoviesState> buildStreamBuilder(
      BuildContext context, MovieBloc movieBloc, TabKey tabKey, int tabIndex) {
    return StreamBuilder(
        key: Key('streamBuilder'),
        stream: movieBloc.stream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  key: Key('content'),
                  children: <Widget>[
                    // Fade in an Empty Result screen if the search contained
                    // no items
                    EmptyWidget(visible: data is MoviesEmpty),

                    // Fade in a loading screen when results are being fetched
                    LoadingWidget(visible: data is MoviesLoading),

                    // Fade in an error if something went wrong when fetching
                    // the results
                    ErrorsWidget(
                        visible: data is MoviesError, error: data is MoviesError ? data.error : ""),

                    // Fade in the Result if available
                    MovieListWidget(
                        genre: genre,
                        movieBloc: movieBloc,
                        tabKey: tabKey,
                        movies: data is MoviesPopulated ? getMovies(data, movieBloc, tabKey) : []),
                  ],
                ),
              ),
            ],
          );
        });
  }

	List<TMDBMovieBasic> getMovies(MoviesPopulated data, MovieBloc movieBloc, TabKey tabKey) {
		if (tabKey == TabKey.kUpcoming) {
			return movieBloc.sortMoviesByReleaseDate();
		}
		return data.movies;
	}
}

class MoviesListScreenState extends State<MoviesListScreen> {
  MovieBloc movieBloc;

  @override
  Widget build(BuildContext context) {
    movieBloc = BlocProvider.of<MovieBloc>(context);

    return Column(key: Key("rootColumn"), children: [
      Flexible(
        child: widget.buildStreamBuilder(
          context,
          movieBloc,
          movieBloc.tabKey,
          movieBloc.tabKey.index,
        ),
      ),
    ]);
  }
}
