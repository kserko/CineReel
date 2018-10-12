import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/navigation/router.dart';
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
            return _avatar(context, index);
          },
        ),
      ),
    );
  }

  Widget _avatar(BuildContext context, int index) {
    Cast cast = movieDetails.hasData ? movieDetails.credits.cast[index] : null;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Router.pushPersonScreen(context, cast.id),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_buildCircularAvatar(cast, index), _buildCastName(cast)]),
        ),
      ),
    );
  }

  Container _buildCastName(Cast cast) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        cast != null ? cast.name : "",
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  Widget _buildCircularAvatar(Cast cast, int index) {
    return Hero(
      child: Material(
        color: Colors.transparent,
        child: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.only(top: 88.0),
            ),
            radius: 40.0,
            backgroundImage: _image(cast)),
      ),
      tag: "tag-${cast.id}",
    );
  }

  ImageProvider _image(Cast cast) {
    return FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: ImageHelper.getCastFullProfilePath(cast.profilePath, PROFILE_SIZES['medium']))
        .image;
  }
}
