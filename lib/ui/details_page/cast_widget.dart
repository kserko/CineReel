import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_advanced_networkimage/transition_to_image.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';
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
          itemCount:
              movieDetails != null ? movieDetails.credits.cast.length : 8,
          itemBuilder: (BuildContext context, int index) {
            return _buildActorWidget(index);
          },
        ),
      ),
    );
  }

  Widget _buildActorWidget(int index) {
    var actor = null;
    try {
      actor = movieDetails.credits.cast[index];
    } catch (e) {}
    return avatar(actor);
  }

  Padding avatar(Cast actor) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: avatarColumn(actor),
    );
  }

  Widget avatarColumn(Cast actor) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildCircularAvatar(actor),
          Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: actorName(actor),
          )
        ]);
  }

  Text actorName(Cast actor) {
    return Text(
      actor != null ? actor.name : "",
      style: TextStyle(fontSize: 12.0),
    );
  }

  Widget _buildCircularAvatar(Cast actor) {
    if (actor != null) {
      return CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.only(top: 88.0),
          ),
          radius: 40.0,
          backgroundImage: image(actor));
    } else {
      //load a placeholder if the data hasn't yet loaded
      return CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.only(top: 88.0),
          ),
          radius: 40.0,
          backgroundColor: Colors.black);
    }
  }

  ImageProvider image(Cast actor) {
    return FadeInImage
        .memoryNetwork(
            placeholder: kTransparentImage,
            image: ImageHelper.getCastFullProfilePath(
                actor.profilePath, PROFILE_SIZES['medium']))
        .image;
  }

  ImageProvider advancedImage(Cast actor) {
    return new TransitionToImage(
            AdvancedNetworkImage(ImageHelper.getCastFullProfilePath(
                actor.profilePath, PROFILE_SIZES['medium'])),
            useReload: false,
            fallbackWidget: SizedBox(height: 300.0))
        .image;
  }
}
