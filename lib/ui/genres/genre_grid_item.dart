import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GenreGridItem extends StatelessWidget {
  final TMDBGenre genre;

  GenreGridItem({TMDBGenre this.genre});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Container(
        child: FlatButton(
          textColor: Theme.of(context).accentColor,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Router.pushMoviesByGenreList(context, genre);
          },
          child: Hero(
            child: Material(
              color: Colors.transparent,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "${genre.name}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Theme.of(context).accentColor),
                ),
              ),
            ),
            tag: "${genre.name}",
          ),
        ),
      ),
    );
  }
}
