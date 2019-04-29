import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_details_header_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_extra_content_widget.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/material.dart';

class MovieDetailsContentWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final bool hasFailed;

  MovieDetailsContentWidget(
      this.movieDetails, this.movieDetailsBloc, bool this.hasFailed);

  @override
  Widget build(BuildContext context) {
    //use a ListView to make the screen vertically scrollable
    return ListView(
      children: <Widget>[
        buildHeaderImage(context),
        buildTitle(),
        buildMinorDetailsRow(),
        buildOverview(),
        buildMovieExtraDetailsContainer(context),
      ],
    );
  }

  Widget buildHeaderImage(BuildContext context) {
    return SizedBox(
      child: MovieDetailsHeaderWidget(
        id: movieDetails.movieBasic.id,
        backdropPath: movieDetails.movieBasic.backdropPath,
      ),
    );
  }

  Widget buildMovieExtraDetailsContainer(BuildContext context) {
    return CrossFadeWidgets(
        childOne: MovieExtraContentWidget(
            movieDetails: movieDetails, movieDetailsBloc: movieDetailsBloc),
        childTwo:
            ErrorsWidget(visible: true, error: movieDetails.status_message),
        showChildOne: !hasFailed);
  }

  Widget buildMinorDetailsRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: INDENT * 2),
      child: CrossFadeWidgets(
          childOne: Row(
            children: <Widget>[
              buildRunningTime(),
              buildReleaseDate(),
              buildDirectorName(),
            ],
          ),
          childTwo: Container(),
          showChildOne: movieDetails.hasData),
    );
  }

  Widget buildOverview() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: INDENT),
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
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(formattedReleaseDate, style: TextStyle(fontSize: 13.0)),
      );
    }
    return Container();
  }

  buildDirectorName() {
    if (movieDetails.getDirector().isEmpty) {
      return Container();
    }
    return Row(
      children: <Widget>[
        getDotSeparator(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("directed by ${movieDetails.getDirector()}",
              style: TextStyle(fontSize: 13.0)),
        ),
      ],
    );
  }
}
