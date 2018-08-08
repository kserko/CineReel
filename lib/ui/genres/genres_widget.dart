import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:flutter/widgets.dart';

class GenresWidget extends StatelessWidget {
	final TMDBGenres genres;
	final bool visible;

	GenresWidget({this.genres, this.visible});

	@override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
			opacity: visible ? 1.0 : 0.0, duration: Duration(milliseconds: 300),
			child: Container(child: Text("Genres populated"),)
		);
  }
}
