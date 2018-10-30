import 'package:cine_reel/api/tmdb_api.dart';
import 'package:cine_reel/bloc/movie_bloc.dart';
import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/ui/tabs/tab_object.dart';

class MovieListForGenreBloc extends MovieBloc {
  TMDBGenre genre;

  MovieListForGenreBloc(TMDBApi api, TMDBGenre this.genre)
      : super(api: api, tabKey: TabKey.kGenres, genre: genre);
}
