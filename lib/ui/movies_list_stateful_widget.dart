import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/ui/movie_row.dart';
import 'package:flutter_bloc_movies/utils/TabConstants.dart';

//As a stateful widget this will be created once and subsequent calls to
//create the widget in the same context (i.e in page_stream_builder)
// will only call the build method of the state object
class MovieListStatefulWidget extends StatefulWidget {
  final List<Movie> movies;
	final TabKey tabKey;
	final MovieBloc movieBloc;

	MovieListStatefulWidget({Key key, this.movies, this.tabKey, this.movieBloc}) : super
			(key: key);

  @override
  MyListState createState() {
		return new MyListState();
  }
}

class MyListState extends State<MovieListStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: this.widget.movies.isNotEmpty ? 1.0 : 0.0,
      child: ListView.builder(
        itemCount: this.widget.movies.length,
        itemBuilder: (context, index) {
          final item = this.widget.movies[index];
          return MovieRow(item, index);
        },
      ),
    );
  }
}