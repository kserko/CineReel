import 'package:cine_reel/bloc/app_bloc.dart';
import 'package:cine_reel/bloc/bloc_provider.dart';
import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
	final title = APP_NAME;

	@override
	Widget build(BuildContext context) {
		AppBloc appBloc = AppBloc();
		return BlocProvider<AppBloc>(
			child: MaterialApp(
				localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
					appBloc.deviceLocale = locale;
				},
				title: title,
				theme: new ThemeData(
					dividerColor: Colors.white,
					brightness: Brightness.dark,
					primarySwatch: Colors.blueGrey,
					accentColor: Colors.deepOrange,
				),
				home: HomePage(title: title),
			),
			bloc: appBloc,
		);
	}
}
