import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/ui/poster_row.dart';
import 'package:flutter_bloc_movies/ui/scroll_controller/list_controller.dart';
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
  ListController _scrollController;

	@override
	void initState() {
		super.initState();
		_scrollController = ListController()..addListener(_scrollListener);
	}

	void _scrollListener() {
		if (_scrollController.position.extentAfter < 2000 && !_scrollController
				.isPaused) {
			this.widget.movieBloc.nextPage.add(this.widget.tabKey);
			_scrollController.pause();
		}
	}

	@override
  Widget build(BuildContext context) {
		_scrollController.unPause();
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: this.widget.movies.isNotEmpty ? 1.0 : 0.0,
      child: ListView.builder(
				controller: _scrollController,
        itemCount: this.widget.movies.length,
        itemBuilder: (context, index) {
					final item = this.widget.movies[index];
          return MovieRow2(item, index);
        },
      ),
    );
  }
}