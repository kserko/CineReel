import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/loading_widget.dart';
import 'package:cine_reel/ui/details_screen/cast_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_details_ratings_widget.dart';
import 'package:flutter/widgets.dart';

class MovieExtraContent extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;

  MovieExtraContent({this.movieDetails, this.movieDetailsBloc});


  //this approach of adding things to the builder only when they become available
	//helps us avoid the need to deal with null values in the children
  @override
  Widget build(BuildContext context) {
		List<Widget> builder = [];

    if (movieDetails.hasData) {
      builder.addAll(extraChildren());
    } else {
			builder.add(getLoadingWidget());
		}

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: builder,
    );
  }

  List<Widget> extraChildren() {
    return <Widget>[
      MovieDetailsRatingsWidget(movieDetails: movieDetails, movieDetailsBloc: movieDetailsBloc),
      buildHorizontalDivider(),
      CastWidget(movieDetails: movieDetails),
      buildHorizontalDivider(),
    ];
  }

  Widget getLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LoadingWidget(visible: true),
    );
  }
}
