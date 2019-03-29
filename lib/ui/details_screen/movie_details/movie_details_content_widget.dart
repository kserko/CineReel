import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/blurred_image.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_details/movie_details_enter_animation.dart';
import 'package:cine_reel/ui/details_screen/movie_details/movie_details_extra_content_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_details/movie_details_header_widget.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/material.dart';

class MovieDetailsContentWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final String backgroundSize;
  final bool hasFailed;
  final AnimationController animationController;
  final MovieDetailsEnterAnimation animation;

  MovieDetailsContentWidget(
      {@required this.movieDetails,
      @required this.movieDetailsBloc,
      @required this.hasFailed,
      @required this.backgroundSize,
      @required this.animationController})
      : animation = MovieDetailsEnterAnimation(animationController);

  @override
  Widget build(BuildContext context) {
    MovieDetailsEnterAnimation.fullWidth = MediaQuery.of(context).size.width;

    return AnimatedBuilder(animation: animationController, builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, Widget child) {
    //use a ListView to make the screen vertically scrollable
    return Stack(
      children: <Widget>[
        buildBackground(),
        ListView(
          children: <Widget>[
            buildHeaderImage(context),
            buildTitle(),
            buildMinorDetailsRow(),
            buildOverview(),
            buildHorizontalDivider(context),
            buildMovieExtraDetailsContainer(),
          ],
        ),
      ],
    );
  }

  BlurredImage buildBackground() {
    return BlurredImage(
      id: movieDetails.movieBasic.id.toString(),
      imagePath: movieDetails.movieBasic.posterPath,
      imageSize: backgroundSize,
      posterBlur: animation.posterBlur,
    );
  }

  Widget buildHorizontalDivider(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          width: animation.overviewDividerWidth.value,
          height: 0.5,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget buildHeaderImage(BuildContext context) {
    return Opacity(
      opacity: animation.headerOpacity.value,
      child: MovieDetailsHeaderWidget(
        backdropPath: movieDetails.movieBasic.backdropPath,
      ),
    );
  }

  Widget buildMovieExtraDetailsContainer() {
  	if (!hasFailed) {
			return Opacity(
					opacity: animation.extraDetailsOpacity.value,
					child: MovieDetailsExtraContentWidget(
							movieDetails: movieDetails, movieDetailsBloc: movieDetailsBloc)
			);
		} else {
  		return ErrorsWidget(visible: true, error: movieDetails.status_message);
		}
  }

  Widget buildMinorDetailsRow() {
    List<Widget> minorDetails = movieDetails.hasData
        ? [buildRunningTime(), buildReleaseDate(), buildDirectorName()] : [Container()];
    return Opacity(
      opacity: animation.minorDetailsOpacity.value,
      child: SizedBox(
        height: 40.0,
        child: Row(children: minorDetails),
      ),
    );
  }

  Widget buildOverview() {
    return Opacity(
      opacity: animation.overviewOpacity.value,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Colors.transparent,
          child: Text(
            movieDetails.getOverview,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Opacity(
      opacity: animation.titleOpacity.value,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Text(
                  movieDetails.getTitle,
                  style: STYLE_TITLE,
                ),
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
