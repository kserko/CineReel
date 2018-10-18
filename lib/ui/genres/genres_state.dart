import 'package:cine_reel/models/tmdb_genres.dart';

class GenresState {
  GenresState();
}

class GenresLoading extends GenresState {}

class GenresError extends GenresState {
  final error;
  GenresError(this.error);
}

class GenresPopulated extends GenresState {
  final List<TMDBGenre> genres;

  GenresPopulated(this.genres);
}

class GenresEmpty extends GenresState {}
