import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/bloc/movie_provider.dart';
import 'package:flutter_bloc_movies/common_widgets/CommonWidgets.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/ui/movie_row.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieBloc = MovieProvider.of(context);

    return Scaffold(
      appBar: buildAppBar(context, "flutter Bloc!"),
      body: Column(children: [
        Flexible(child: buildStreamList(movieBloc))
      ]),
    );
  }

  StreamBuilder<List<Movie>> buildStreamList(MovieBloc movieBloc) {
    return StreamBuilder(
            stream: movieBloc.movies,
            initialData: movieBloc.getNowPlayingList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return buildErrorWidget(snapshot.error);
              }
              if (!snapshot.hasData) {
                return buildLoadingWidget();
              }
              return buildListView(snapshot);
            },
          );
  }

  ListView buildListView(AsyncSnapshot<List<Movie>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          print(index);
          return MovieRow(snapshot.data[index]);
        });
  }

  FlatButton buildDownloadButton(MovieBloc movieBloc) {
    return FlatButton.icon(
          onPressed: () => movieBloc.getNowPlayingList(),
          icon: Icon(Icons.cloud_download), label: Text("donwload"));
  }
}
