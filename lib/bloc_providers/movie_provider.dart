import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:flutter/widgets.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider).movieBloc;

  MovieProvider({Key key, MovieBloc movieBloc, Widget child})
      : this.movieBloc = movieBloc ?? null,
        super(child: child, key: key);
}
