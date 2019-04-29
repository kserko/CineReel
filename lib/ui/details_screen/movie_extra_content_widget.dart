import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/errors_widget.dart';
import 'package:cine_reel/ui/common_widgets/loading_widget.dart';
import 'package:cine_reel/ui/details_screen/cast_thumbnails_list_widget.dart';
import 'package:cine_reel/ui/details_screen/genre_pill_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_details_images_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_details_ratings_widget.dart';
import 'package:cine_reel/utils/styles.dart';
import 'package:flutter/widgets.dart';

Container buildSubtitleForDetailsPage(String title) {
  return Container(
      margin: const EdgeInsets.only(left: 8.0, bottom: 18.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(title, style: STYLE_SUBTITLE)));
}

class MovieExtraContentWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;

  MovieExtraContentWidget({this.movieDetails, this.movieDetailsBloc});

  //this approach of adding things to the builder only when they become available
  //helps us avoid the need to deal with null values in the children
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    if (movieDetails.hasData) {
      widgetList.addAll(extraChildren(context));
    } else if (movieDetails.hasErrors()) {
      widgetList
          .add(ErrorsWidget(visible: true, error: movieDetails.status_message));
    } else {
      widgetList.add(getLoadingWidget());
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widgetList,
    );
  }

  List<Widget> extraChildren(BuildContext context) {
    return [
      buildHorizontalDivider(context),
      CastThumbnailsListWidget(movieDetails: movieDetails),
      MovieDetailsRatingsWidget(
          movieDetails: movieDetails, movieDetailsBloc: movieDetailsBloc),
      buildGenres(context),
      MovieDetailsImagesWidget(movieDetails: movieDetails),
    ];
  }

  Widget getLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LoadingWidget(visible: true),
    );
  }

  buildGenres(BuildContext context) {
    if (movieDetails.genres == null || movieDetails.genres.isEmpty) {
      return Container();
    }

    List genres = movieDetails.genres.map((genre) {
      return new GenrePill(
        genre: genre,
        fontSize: 14.0,
      );
    }).toList();

    return Column(
      children: [
        buildHorizontalDivider(context),
        _buildGenrePillsScroller(genres),
        buildHorizontalDivider(context),
      ],
    );
  }

  Container _buildGenrePillsScroller(List genres) {
    return Container(
      height: 45.0,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: genres,
          )
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
