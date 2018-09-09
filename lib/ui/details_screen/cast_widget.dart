import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class CastWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;

  CastWidget({TMDBMovieDetails this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.fromSize(
        size: const Size.fromHeight(120.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieDetails.credits != null ? movieDetails.credits.cast.length : 8,
          itemBuilder: (BuildContext context, int index) {
            return _avatar(index);
          },
        ),
      ),
    );
  }

  Widget _avatar(int index) {
    Cast actor = movieDetails.hasData ? movieDetails.credits.cast[index] : null;
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[_buildCircularAvatar(actor), _buildActorName(actor)]),
    );
  }

  Container _buildActorName(Cast actor) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        actor != null ? actor.name : "",
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  Widget _buildCircularAvatar(Cast cast) {
    return CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.only(top: 88.0),
        ),
        radius: 40.0,
        backgroundImage: _image(cast));
  }

  ImageProvider _image(Cast cast) {
    return FadeInImage
        .memoryNetwork(
            placeholder: kTransparentImage,
            image: ImageHelper.getCastFullProfilePath(cast, PROFILE_SIZES['medium']))
        .image;
  }
}
