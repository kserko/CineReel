import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_details_backdrop_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_extra_content.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/material.dart';

class MovieDetailsContent extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final bool hasFailed;

  MovieDetailsContent(this.movieDetails, this.movieDetailsBloc, bool this.hasFailed);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MovieDetailsBackdropWidget(backdropPath: movieDetails.movieBasic.backdropPath),
          buildTitle(),
          buildMinorDetailsRow(),
          buildOverview(),
          buildHorizontalDivider(),
          buildMovieExtraDetailsContainer(),
        ],
      ),
    );
  }

  Widget buildMovieExtraDetailsContainer() {
    return AnimateChildren(
        childOne: MovieExtraContent(movieDetails: movieDetails, movieDetailsBloc: movieDetailsBloc),
        childTwo: ErrorsWidget(visible: true, error: movieDetails.status_message),
        showHappyPath: !hasFailed);
  }

  Widget buildMinorDetailsRow() {
    return AnimateChildren(
        childOne: Row(
          children: <Widget>[
            buildRunningTime(),
            buildReleaseDate(),
            buildDirectorName(),
          ],
        ),
        childTwo: Container(),
        showHappyPath: movieDetails.hasData);
  }

  Widget buildOverview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: Text(
          movieDetails.getOverview,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Hero(
                //wrapping up a Text with Material prevents the formatting
                // being lost between transitions
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    movieDetails.getTitle,
                    style: STYLE_TITLE,
                  ),
                ),
                tag: "${movieDetails.getId}-${movieDetails.getTitle}",
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildRunningTime() {
		var formattedRunningTime = movieDetails.getFormattedRunningTime();

		if (formattedRunningTime != null && formattedRunningTime.isNotEmpty) {
			return Row(
				children: <Widget>[
					Padding(
						padding: const EdgeInsets.all(8.0),
						child: Text(
							formattedRunningTime,
							style: TextStyle(fontSize: 13.0),
						),
					),
					getDotSeparator(),
				],
			);
		}
		return Container();
	}

  buildReleaseDate() {
    var formattedReleaseDate = movieDetails.getFormattedReleaseDate();
    if (formattedReleaseDate != null && formattedReleaseDate.isNotEmpty) {
			return Row(
				children: <Widget>[
					Padding(
						padding: const EdgeInsets.all(8.0),
						child: Text(formattedReleaseDate, style: TextStyle(fontSize: 13.0)),
					),
					getDotSeparator(),
				],
			);
		}
		return Container();
  }

  buildDirectorName() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("directed by ${movieDetails.getDirector()}", style: TextStyle(fontSize: 13.0)),
      ),
    );
  }
}
