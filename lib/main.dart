import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/ui/home_page.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
	MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
			: super(builder: builder, settings: settings);

	@override
	Widget buildTransitions(BuildContext context,
			Animation<double> animation,
			Animation<double> secondaryAnimation,
			Widget child) {
		if (settings.isInitialRoute)
			return child;
		// Fades between routes. (If you don't want any animation,
		// just return child.)
		return new FadeTransition(opacity: animation, child: child);
	}
}

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
	var title = 'A Flutter TMDB explorer in BLoCs';

	// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//			initialRoute: '/',
//      routes: {
//				'/': (_) => HomePage(title: title),
//				'/details': (_) => MovieDetails(_),
//			},
      title: title,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
			home: HomePage(title: title),
    );
  }
}