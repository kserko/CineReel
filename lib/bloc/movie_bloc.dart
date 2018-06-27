import 'dart:async';

import 'package:flutter_bloc_movies/api/api.dart';
import 'package:flutter_bloc_movies/models/Movie.dart';
import 'package:flutter_bloc_movies/models/MoviesResponse.dart';

class MovieBloc {
  TMDBApi api;

  StreamController<List<Movie>> streamController = StreamController<
      List<Movie>>();

  Stream<List<Movie>> get movies => streamController.stream;


  MovieBloc(this.api);

  void getDiscoverList() {
    streamController.addStream(api.discoverMovies(page: 1).then((MoviesResponse
    moviesResponse) {
      return moviesResponse.results;
    }).asStream());
  }

  getNowPlayingList() {
    streamController.addStream(api.nowPlayingMovies(page: 1)
        .then((MoviesResponse moviesResponse) {
      if (moviesResponse.hasResults()) {
        return moviesResponse.results;
      }
      if (moviesResponse.hasErrors()) {
        throw(moviesResponse.errors[0]);
      }}).asStream());
  }
}