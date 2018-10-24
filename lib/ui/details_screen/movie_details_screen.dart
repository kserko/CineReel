import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/ui/details_screen/movie_details_state.dart';
import 'package:cine_reel/ui/details_screen/movie_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String backgroundSize;

  @override
  _MovieDetailsStatefulState createState() => _MovieDetailsStatefulState();

  MovieDetailsScreen({Key key, this.backgroundSize}) : super(key: key);
}

class _MovieDetailsStatefulState extends State<MovieDetailsScreen> {
  MovieDetailsBloc movieDetailsBloc;

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    movieDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    movieDetailsBloc = BlocProvider.of<MovieDetailsBloc>(context);
    return Scaffold(
      body: StreamBuilder(
        key: Key('streamBuilder'),
        stream: movieDetailsBloc.stream,
        initialData: movieDetailsBloc.initialData(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Stack(
            key: Key('content'),
            children: <Widget>[
              MovieDetailsWidget(
                  hasFailed: data == MovieDetailsFailureState,
                  movieDetailsBloc: movieDetailsBloc,
                  movieDetails: data.movieDetails,
                  backgroundSize: widget.backgroundSize)
            ],
          );
        },
      ),
    );
  }
}
