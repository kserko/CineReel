import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/movie_provider.dart';
import 'package:flutter_bloc_movies/common_widgets/CommonWidgets.dart';
import 'package:flutter_bloc_movies/ui/movie_row.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Bloc Movies',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieProvider(
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieBloc = MovieProvider.of(context);

    return Scaffold(
      appBar: buildAppBar(context, "flutter Bloc!"),
      body: Column(children: [
        FlatButton.icon(onPressed: () => movieBloc.getNowPlayingList(),
            icon: Icon(Icons.cloud_download), label: Text
          ("donwload")),
        Flexible(
            child: StreamBuilder(
              stream: movieBloc.movies,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      print(index);
                      return MovieRow(snapshot.data[index]);
                    });
              },
        ))
      ]),
    );
  }
}
