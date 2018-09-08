import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class CrewWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;

  CrewWidget({TMDBMovieDetails this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.fromSize(
        size: const Size.fromHeight(120.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieDetails.credits != null ? movieDetails.credits.crew.length : 8,
          itemBuilder: (BuildContext context, int index) {
            return _avatar(index);
          },
        ),
      ),
    );
  }

  Padding _avatar(int index) {
    Crew crew = movieDetails.hasData ? movieDetails.credits.crew[index] : null;
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            _buildCircularAvatar(crew),
            _buildCrewDetails(crew),
          ]),
    );
  }

  Container _buildCrewDetails(Crew crew) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: <Widget>[
          Text(
            crew != null ? crew.name : "",
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            crew != null ? crew.job : "",
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
    );
  }

  Widget _buildCircularAvatar(Crew crew) {
    return CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.only(top: 88.0),
        ),
        radius: 40.0,
        backgroundImage: _image(crew));
  }

  ImageProvider _image(Crew crew) {
    return FadeInImage
        .memoryNetwork(
            placeholder: kTransparentImage,
            image: ImageHelper.getCastFullProfilePath(crew, PROFILE_SIZES['medium']))
        .image;
  }
}
