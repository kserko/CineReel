import 'package:cine_reel/bloc/person_details_bloc.dart';
import 'package:flutter/widgets.dart';

class PersonDetailsProvider extends InheritedWidget {
	final PersonDetailsBloc castDetailsBloc;

	@override
	bool updateShouldNotify(InheritedWidget oldWidget) => true;

	static PersonDetailsBloc of(BuildContext context) =>
			(context.inheritFromWidgetOfExactType(PersonDetailsProvider) as PersonDetailsProvider).castDetailsBloc;

	PersonDetailsProvider({
		Key key,
		PersonDetailsBloc castDetailsBloc,
		Widget child}):
			this.castDetailsBloc = castDetailsBloc ?? null,
			super(child: child, key: key);


}