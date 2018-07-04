import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_provider.dart';
import 'package:flutter_bloc_movies/state/movie_state.dart';
import 'package:flutter_bloc_movies/ui/empty_result_widget.dart';
import 'package:flutter_bloc_movies/ui/movies_error_widget.dart';
import 'package:flutter_bloc_movies/ui/movies_loading_widget.dart';
import 'package:flutter_bloc_movies/ui/movies_result_widget.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';

class StreamComponent extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return Column(children: [Flexible(child: buildStreamBuilder(context, TabKey
				.kNowPlaying, TabKey.kNowPlaying.index))
		]);
	}

	StreamBuilder<MoviesState> buildStreamBuilder(BuildContext context, TabKey
	tabKey, int
	tabIndex) {
		final movieBloc = MovieProvider.of(context);

//    var stream = movieBloc.getStreamForTab(tabKey);
//		var initialDataForStream = movieBloc.getInitialData(tabKey);
//		var state = movieBloc.getStateFor(tabKey);

		return StreamBuilder(
				stream: movieBloc.getStreamForTab(tabKey),
				initialData: movieBloc.fetchNextPageForTab(tabKey),
				builder: (context, snapshot) {
					final data = snapshot.data;
					return Flex(
						direction: Axis.vertical,
						children: [
							Expanded(
								child: Stack(
									children: <Widget>[
										// Fade in an Empty Result screen if the search contained
										// no items
										EmptyWidget(visible: data is MoviesEmpty),

										// Fade in a loading screen when results are being fetched
										// from Github
										MoviesLoadingWidget(visible: data is MoviesLoading),

										// Fade in an error if something went wrong when fetching
										// the results
										MoviesErrorWidget(visible: data is MoviesError, error:
										data is MoviesError ? data.error : ""),

										// Fade in the Result if available
										MoviesResultWidget(
											items: data is MoviesPopulated ? data.result : [],
										),
									],
								),
							),
						],
					);
				});
	}
}