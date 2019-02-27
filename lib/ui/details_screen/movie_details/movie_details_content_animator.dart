import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/details_screen/movie_details/movie_details_content_widget.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsContentAnimator extends StatefulWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;
  final String backgroundSize;
  final bool hasFailed;

  MovieDetailsContentAnimator({
    @required this.movieDetails,
    @required this.movieDetailsBloc,
		@required this.backgroundSize,
    @required this.hasFailed,
  });

  @override
  _MovieDetailsContentAnimatorState createState() => _MovieDetailsContentAnimatorState();
}

class _MovieDetailsContentAnimatorState extends State<MovieDetailsContentAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1800));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MovieDetailsContentWidget(
			movieDetails: widget.movieDetails,
			movieDetailsBloc: widget.movieDetailsBloc,
      backgroundSize: widget.backgroundSize,
      hasFailed: widget.hasFailed,
      animationController: _controller,
    );
  }
}