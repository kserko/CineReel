import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
	final title = APP_NAME;

	// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      theme: new ThemeData(
				dividerColor: Colors.white,
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
				accentColor: Colors.deepOrange,
      ),
			home: HomePage(title: title),
    );
  }
}