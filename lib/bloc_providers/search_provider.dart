import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/search_bloc.dart';

class SearchProvider extends InheritedWidget {
	final SearchBloc searchBloc;

	@override
	bool updateShouldNotify(InheritedWidget oldWidget) => true;

	static SearchBloc of(BuildContext context) =>
			(context.inheritFromWidgetOfExactType(SearchProvider) as SearchProvider).searchBloc;

	SearchProvider({
		Key key,
		SearchBloc searchBloc,
			Widget child}) :
			this.searchBloc = searchBloc ?? null,
	super(child: child, key: key);


}
