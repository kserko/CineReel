import 'dart:math';

import 'package:cine_reel/models/tmdb_genres.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GenreGridItem extends StatelessWidget {
  final TMDBGenre genre;
  final Random random = Random();

  GenreGridItem({TMDBGenre this.genre});

  @override
  Widget build(BuildContext context) {
    var color =
        Color((random.nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(0.5);

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        child: FlatButton(
          color: color,
          onPressed: () {
            Router.goToMoviesByGenreList(context, genre);
          },
          child: Hero(
            child: Material(
              color: Colors.transparent,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "${genre.name}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0, color: Colors.white),
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
