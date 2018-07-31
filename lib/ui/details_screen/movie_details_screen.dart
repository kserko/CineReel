import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_movies/bloc_providers/movie_details_provider.dart';
import 'package:flutter_bloc_movies/ui/details_screen/movie_details_widget.dart';

class MovieDetailsScreen extends StatefulWidget {

  @override
  _MovieDetailsStatefulState createState() => _MovieDetailsStatefulState();

	MovieDetailsScreen({Key key}) : super(key: key);
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
		movieDetailsBloc = MovieDetailsProvider.of(context);
		return StreamBuilder(
				stream: movieDetailsBloc.stream,
				initialData: movieDetailsBloc.initialData(),
				builder: (context, snapshot) {
					final data = snapshot.data;
					return Column(
						children: <Widget>[
							Expanded(
								child: Stack(
									children: <Widget>[
										MovieDetailsWidget(
												hasFailed: data.hasFailed,
												movieDetailsBloc: movieDetailsBloc,
												movieDetails: data.movieDetails
										)

									],
								),
							)
						],
					);
				}
		);
	}
}
