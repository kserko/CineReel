import 'package:cine_reel/bloc/search_bloc.dart';
import 'package:flutter/widgets.dart';

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
