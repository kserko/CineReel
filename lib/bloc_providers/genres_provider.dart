import 'package:cine_reel/bloc/genres_bloc.dart';
import 'package:flutter/widgets.dart';

class GenresProvider extends InheritedWidget {
  final GenresBloc genresBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static GenresBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(GenresProvider) as GenresProvider).genresBloc;

  GenresProvider({Key key, GenresBloc genreBloc, Widget child})
      : this.genresBloc = genreBloc ?? null,
        super(child: child, key: key);
}
