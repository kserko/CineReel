import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_details_bloc.dart';

class MovieDetailsProvider extends InheritedWidget {
	final MovieDetailsBloc movieDetailsBloc;

	@override
	bool updateShouldNotify(InheritedWidget oldWidget) => true;

	static MovieDetailsBloc of(BuildContext context) =>
			(context.inheritFromWidgetOfExactType(MovieDetailsProvider) as
			MovieDetailsProvider)
					.movieDetailsBloc;

	MovieDetailsProvider({
		Key key,
		MovieDetailsBloc movieDetailsBloc,
		Widget child
	}):
				this.movieDetailsBloc = movieDetailsBloc ?? null,
				super(child: child, key: key);
}