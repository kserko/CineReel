import 'package:cine_reel/bloc/person_bloc.dart';
import 'package:flutter/widgets.dart';

class PersonProvider extends InheritedWidget {
  final PersonBloc personBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PersonBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PersonProvider) as PersonProvider).personBloc;

  PersonProvider({Key key, @required PersonBloc personBloc, Widget child})
      : this.personBloc = personBloc ?? null,
        super(child: child, key: key);
}
