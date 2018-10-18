import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CrewWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;

  CrewWidget({TMDBMovieDetails this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.fromSize(
        size: const Size.fromHeight(180.0),
        child: ListView.builder(
          itemCount: movieDetails.credits != null ? movieDetails.credits.crew.length : 8,
          itemBuilder: (BuildContext context, int index) {
            Crew crew = movieDetails.credits.crew[index];
            return _buildCrewDetails(crew);
          },
        ),
      ),
    );
  }

  Widget _buildCrewDetails(Crew crew) {
    return ListTile(
      title: Text(crew.name),
      subtitle: Text(crew.job),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    );
  }
}
