import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_movies/Constants.dart';
import 'package:flutter_bloc_movies/models/tmdb_movie_details.dart';
import 'package:flutter_bloc_movies/utils/ImageHelper.dart';
import 'package:transparent_image/transparent_image.dart';

class CastWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;

  CastWidget({TMDBMovieDetails this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Material(
            color: Colors.transparent,
            child: Text("Cast", style: TextStyle(fontSize: 20.0))),
        AnimatedCrossFade(
          crossFadeState: movieDetails.isLoaded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 300),
          firstChild: _buildAvatars(),
          secondChild: _buildPlaceholderAvatars(),
        ),
      ],
    );
  }

  Widget _buildAvatars() {
    return Container(
      child: SizedBox.fromSize(
        size: const Size.fromHeight(120.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              movieDetails.credits != null ? movieDetails.credits.cast.length : 8,
					itemBuilder: (BuildContext context, int index) {
            return _avatar(index);
          },
        ),
      ),
    );

//    return Container(
//				color: Colors.grey,
//        child: SizedBox.fromSize(size: const Size.fromHeight(120.0)));
  }

  Container _buildPlaceholderAvatars() {
    return Container(
      child: SizedBox.fromSize(
        size: const Size.fromHeight(120.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _placeHolderAvatar(),
            _placeHolderAvatar(),
            _placeHolderAvatar(),
            _placeHolderAvatar(),
            _placeHolderAvatar()
          ],
        ),
      ),
    );
  }

  Padding _avatar(int index) {
  	Cast actor = movieDetails.isLoaded ? movieDetails.credits.cast[index] :
		null;
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildCircularAvatar(actor),
            _buildActorName(actor)
          ]),
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

  //Placeholders
  Padding _placeHolderAvatar() {
    return Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildPlaceholderCircularAvatar(),
              _buildPlaceholderActorName(),
            ]));
  }

  Container _buildPlaceholderActorName() {
    return Container(padding: const EdgeInsets.only(top: 5.0),
              child: Text("", style: TextStyle(fontSize: 12.0),),
            );
  }

  Widget _buildPlaceholderCircularAvatar() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.only(top: 88.0),
          ),
          radius: 40.0,
          backgroundColor: Colors.black),
    );
  }
}
