import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:flutter/material.dart';

class GenrePill extends StatelessWidget {
  const GenrePill({
    Key key,
    @required this.genre,
  }) : super(key: key);

  final TMDBGenre genre;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Router.goToMoviesByGenreList(context, genre),
      child: Hero(
        tag: "${genre.name}",
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.white12),
            ),
            child: Text(
              genre.name,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
