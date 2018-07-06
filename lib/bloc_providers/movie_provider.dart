import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;

	@override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider)
          .movieBloc;

  MovieProvider({
    Key key,
    MovieBloc movieBloc,
    Widget child
  }):
				this.movieBloc = movieBloc ?? null,
        super(child: child, key: key);
}