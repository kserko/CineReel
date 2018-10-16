import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/navigation/router.dart';
import 'package:cine_reel/ui/common_widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const castHeight = 200.0;

class CastWidget extends StatelessWidget {
  final TMDBMovieDetails movieDetails;

  CastWidget({TMDBMovieDetails this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.fromSize(
        size: const Size.fromHeight(castHeight),
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
        onTap: () => Router.pushPersonScreen(context, cast),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: SizedBox(
            width: 120.0,
            height: castHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildPhotoThumbnail(cast, index),
                _buildCastName(cast),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCastName(Cast cast) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: <Widget>[
          _buildName(cast),
          _buildCharacter(cast),
        ],
      ),
    );
  }

  Widget _buildName(Cast cast) {
    return Center(
      child: Text(
        cast.name,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  Widget _buildCharacter(Cast cast) {
    return Center(
      child: Text(
        "(${cast.character})", textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  Widget _buildPhotoThumbnail(Cast cast, int index) {
    return Expanded(
      child: Hero(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
							child: ClipRRect(
									borderRadius: BorderRadius.circular(30.0),
									child: ImageLoader(cast.profilePath)),
					),
        ),
        tag: "tag-${cast.id}",
      ),
    );
  }
}
