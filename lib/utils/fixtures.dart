import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/ui/details_screen/genre_pill_widget.dart';

List<GenrePill> createListOfGenresPills() {
  List<GenrePill> list = [];
  for (int i = 0; i < 10; i++) {
    TMDBGenre genre = TMDBGenre(i, " genre $i");
    list.add(GenrePill(
      genre: genre,
    ));
  }
  return list;
}
